local races = {}

MySQL.Async.fetchAll('SELECT * FROM races_checkpoints ORDER BY id ASC',{},
function(result)
    for k,v in ipairs(result) do
        if not races[v.race] then
            races[v.race] = {
                checkpoints = {
                    vector3(v.x,v.y,v.z)
                }
            }
        else
            table.insert(races[v.race].checkpoints, vector3(v.x,v.y,v.z))
        end
    end
end)

-- cuando un jugador se conecta se le envían las carreras
RegisterNetEvent("mafiaracing:updateRacesServer")
AddEventHandler("mafiaracing:updateRacesServer", function(src)
    TriggerClientEvent("mafiaracing:updateRacesClient", src, races)
end)

-- devuelve la licencia de rockstar del jugador con cierta id
function getIdentifier(playerId)
    for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			return string.sub(v, 9)
		end
	end
end

-- devuelve al usuario su nombre para las carreras
RegisterNetEvent("mafiaracing:getNameServer")
AddEventHandler("mafiaracing:getNameServer", function(src)
    -- recoge el nombre del jugador
    MySQL.Async.fetchAll('SELECT nickname FROM users WHERE identifier = @id',
    { ['@id'] = getIdentifier(src)},
    function(result)
        TriggerClientEvent("mafiaracing:getNameClient", src, result[1].nickname)
    end)
end)

-- llama el evento de crear lobby en todos los clientes
RegisterNetEvent("mafiaracing:createLobbyServer")
AddEventHandler("mafiaracing:createLobbyServer", function(src, race)
    if races[race] then
        if not races[race].used then
            if #races[race].checkpoints > 1 then
                races[race].used = 0
                TriggerClientEvent("mafiaracing:updateRaceState", -1, race, 0)
                TriggerClientEvent("mafiaracing:createLobbyClient", -1, race)
                TriggerClientEvent("mafiaracing:serverMessage", src, "~g~Has creado un lobby para la carrera ~b~".. race .."~g~.")    
            else
                TriggerClientEvent("mafiaracing:serverMessage", src, "~r~Se necesitan al menos 2 checkpoints.")   
            end
        else
            TriggerClientEvent("mafiaracing:serverMessage", src, "~r~Ya está siendo utilizada la carrera.")
        end
    else
        TriggerClientEvent("mafiaracing:serverMessage", src, "~r~Esta carrera no existe.")
    end
end)

RegisterNetEvent("mafiaracing:closeLobbyServer")
AddEventHandler("mafiaracing:closeLobbyServer", function(src, race)
    if races[race].used == 0 then
        races[race].used = nil
        TriggerClientEvent("mafiaracing:updateRaceState", -1, race, nil)
        TriggerClientEvent("mafiaracing:serverMessage", src, "~g~Has cerrado el lobby de la carrera ~b~".. race .."~g~.")
    else
        TriggerClientEvent("mafiaracing:serverMessage", src, "~r~No hay ningún lobby creado.")
    end
end)

-- llama el evento de empezar la carrera en todos los clientes
RegisterNetEvent("mafiaracing:startRaceServer")
AddEventHandler("mafiaracing:startRaceServer", function(src, race)
    if races[race].used == 0 then
        races[race].used = 1
        races[race].runners = {}
        races[race].drivenout = {}
        TriggerClientEvent("mafiaracing:updateRaceState", -1, race, 1)
        TriggerClientEvent("mafiaracing:startRaceClient", -1, race)
        Wait(1000)
        if #races[race].runners == 0 then
            races[race].used = nil
            TriggerClientEvent("mafiaracing:updateRaceState", -1, race, nil)
            TriggerClientEvent("mafiaracing:serverMessage", src, "~r~No se ha detectado ningún jugador en el lobby.")
        else
            TriggerClientEvent("mafiaracing:giveLeaderboard", -1, race, races[race].runners, races[race].drivenout)
            TriggerClientEvent("mafiaracing:serverMessage", src, "~g~Has empezado la carrera ~b~".. race .."~g~.")
            Wait(4000)
            races[race].runners = {}
            races[race].drivenout = {}
        end
    else
        TriggerClientEvent("mafiaracing:serverMessage", src, "~r~No hay ningún lobby creado.")
    end    
end)

RegisterNetEvent("mafiaracing:endRaceServer")
AddEventHandler("mafiaracing:endRaceServer", function(src, race)
    if races[race].used == 1 then
        races[race].used = nil
        TriggerClientEvent("mafiaracing:updateRaceState", -1, race, nil)
        TriggerClientEvent("mafiaracing:serverMessage", src, "~g~Has terminado la carrera ~b~".. race .."~g~.")
    else
        TriggerClientEvent("mafiaracing:serverMessage", src, "~r~No está la carrera activa.")
    end
end)

-- recibe el estado de un piloto en la carrera y lo coloca en su posición en el leaderboard
RegisterNetEvent("mafiaracing:raceInformation")
AddEventHandler("mafiaracing:raceInformation", function(src, race, name, currrentCheckPoint, distance, finished)
    local removed = false
    local inserted = false
    local i = 1
    local k = 0
    local starttime = os.time()
    local time = starttime
    while (not removed or not inserted) and i <= #races[race].runners do
        if (not races[race].runners[i].finished) then
            if (src == races[race].runners[i].source) then
                starttime = races[race].runners[i].starttime
                table.remove(races[race].runners, i)
                removed = true
                i = i - 1
            else 
                if (not inserted) then
                    if currrentCheckPoint > races[race].runners[i].currrentCheckPoint or (currrentCheckPoint == races[race].runners[i].currrentCheckPoint and distance < races[race].runners[i].distance) then
                        table.insert(races[race].runners, i, {source = src, name = name, currrentCheckPoint = currrentCheckPoint, distance = distance, finished = finished, endtime = time})
                        k = i
                        inserted = true
                    end
                end
            end
        end
        i = i + 1
    end
    if (not inserted) then
        table.insert(races[race].runners, i, {source = src, name = name, currrentCheckPoint = currrentCheckPoint, distance = distance, finished = finished, endtime = time})
        k = #races[race].runners
    end

    races[race].runners[k].starttime = starttime

    if (races[race].runners[#races[race].runners].finished) then
        races[race].used = nil
        TriggerClientEvent("mafiaracing:giveLeaderboard", -1, race, races[race].runners, races[race].drivenout)
        TriggerClientEvent("mafiaracing:updateRaceState", -1, race, nil)
    else
        TriggerClientEvent("mafiaracing:giveLeaderboard", src, race, races[race].runners, races[race].drivenout)
    end
end)

-- elimina al corredor si se desconecta
AddEventHandler("playerDropped", function(reason)
    local src = source
    for k1,v1 in pairs(races) do
        if (v1.runners) then
            for k2,v2 in ipairs(v1.runners) do
                if v2.source == src then
                    TriggerEvent("mafiaracing:removeFromRace", src, k1)
                    return
                end
            end
        end
    end
end)

-- elimina a un jugador de la carrera
RegisterNetEvent("mafiaracing:removeFromRace")
AddEventHandler("mafiaracing:removeFromRace", function(src, race)
    local i = 1
    local removed = false
    local v = 0
    while (not removed) do
        if (races[race].runners[i].source == src) then
            v = races[race].runners[i]
            table.remove(races[race].runners, i)
            removed = true
        end
        i = i + 1
    end

    table.insert(races[race].drivenout, 1, v)

    if (#races[race].runners == 0 or races[race].runners[#races[race].runners].finished == true) then
        races[race].used = nil
        TriggerClientEvent("mafiaracing:giveLeaderboard", -1, race, races[race].runners, races[race].drivenout)
        TriggerClientEvent("mafiaracing:updateRaceState", -1, race, nil)
    end
end)

RegisterNetEvent("mafiaracing:usedState")
AddEventHandler("mafiaracing:usedState", function(race, state)
    races[race].used = state
    TriggerClientEvent("mafiaracing:updateRaceState", -1, race, state)
end)

RegisterNetEvent("mafiaracing:updateRaceServer")
AddEventHandler("mafiaracing:updateRaceServer", function(race, content, src)
    Citizen.CreateThread(function()
        races[race] = content
        MySQL.Async.execute("DELETE FROM races_checkpoints WHERE race = @race",     
        {["race"] = race},
        function()
            if races[race] then
                if #races[race].checkpoints > 0 then
                    local query = "INSERT INTO races_checkpoints (race, x, y, z) VALUES"
                    local values = {["race"] = race}
                    for k,v in ipairs(races[race].checkpoints) do
                        query = query .. "(@race, @x" .. k .. ", @y" .. k .. ", @z" .. k .. ")"
                        if k ~= #races[race].checkpoints then
                            query = query .. ","
                        end
                        values["x"..k] = v.x
                        values["y"..k] = v.y
                        values["z"..k] = v.z
                    end
                    MySQL.Async.execute(query, values,
                    function()
                        if src then
                            TriggerClientEvent("mafiaracing:serverMessage", src, "~g~Se ha guardado la carrera correctamente.")
                        end
                        TriggerClientEvent("mafiaracing:updateRaceClient", -1, race, content)
                    end)
                else
                    races[race] = nil
                    TriggerClientEvent("mafiaracing:updateRaceClient", -1, race, nil)
                end
            else
                TriggerClientEvent("mafiaracing:updateRaceClient", -1, race, nil)
            end
        end)
    end)
end)
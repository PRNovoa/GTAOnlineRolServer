local races
local selected
local editing
local name = nil
local blips = {}
local racing = false
local currentCheckPoint = 0
local distance = 0

-- Cosas de ESX
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job2 == nil do
        Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    local lastjob2 = ESX.PlayerData.job2.name
    ESX.PlayerData.job2 = job2
    if job2.name ~= "mafiarace" then
        for k,v in pairs(blips) do
            RemoveBlip(v)
        end
        blips = {}
    elseif lastjob2 ~= job2.name then
        for k,v in pairs(races) do
            blips[k] = AddBlipForCoord(v.checkpoints[1].x, v.checkpoints[1].y, v.checkpoints[1].z)
            
            SetBlipSprite (blips[k], 38)
            SetBlipDisplay(blips[k], 4)
            SetBlipScale  (blips[k], 0.8)
            SetBlipAsShortRange(blips[k], true)
            SetBlipColour(blips[k], SelectBlipColour(v.used))

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(k)
            EndTextCommandSetBlipName(blips[k])
        end
    end
end)

Citizen.CreateThread(function()
    Wait(1000)
    TriggerServerEvent("mafiaracing:updateRacesServer", GetPlayerServerId(PlayerId()))
    TriggerServerEvent("mafiaracing:getNameServer", GetPlayerServerId(PlayerId()))
end)


-- pone el color del blip en función del estado de esa carrera
function SelectBlipColour(used)
    if used then
        if used == 0 then
            return 3
        elseif used == 1 then
            return 27
        else
            return 1
        end
    else
        return 0
    end
end

-- el servidor devuelve las carreras
RegisterNetEvent("mafiaracing:updateRacesClient")
AddEventHandler("mafiaracing:updateRacesClient", function(r)
    races = r
    for k,v in pairs(races) do
        if v.used == 0 then
            TriggerEvent("mafiaracing:createLobbyClient", k)
        end
        if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == "mafiarace" then
            blips[k] = AddBlipForCoord(v.checkpoints[1].x, v.checkpoints[1].y, v.checkpoints[1].z)
            
            SetBlipSprite (blips[k], 38)
            SetBlipDisplay(blips[k], 4)
            SetBlipScale  (blips[k], 0.8)
            SetBlipAsShortRange(blips[k], true)
            SetBlipColour(blips[k], SelectBlipColour(v.used))

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(k)
            EndTextCommandSetBlipName(blips[k])
        end
    end
end)

-- el servidor devuelve el nombre del jugador
RegisterNetEvent("mafiaracing:getNameClient")
AddEventHandler("mafiaracing:getNameClient", function(n)
    name = n
end)

-- crea un lobby de una carrera concreta
RegisterNetEvent("mafiaracing:createLobbyClient")
AddEventHandler("mafiaracing:createLobbyClient", function(race)
    Citizen.CreateThread(function()
        if races[race] then
            -- cogemos la posición del primer checkpoint y la del segundo
            local firstCheckPointPos = races[race].checkpoints[1]
            local secondCheckPointPos = races[race].checkpoints[2]
            -- vector direccion de la salida (mirando al checkpoint siguiente)
            local vector = secondCheckPointPos - firstCheckPointPos
            -- posicion del marker que marca el límite para que se unan coches
            local limitMarkerPos = -norm(vector)*Config.DistanteFromRaceStart/2+firstCheckPointPos
            while races[race] and races[race].used == 0 do
                DrawMarker(4, firstCheckPointPos.x, firstCheckPointPos.y, firstCheckPointPos.z+2, vector.x, vector.y, vector.z,
                    0.0, 0.0, 0.0, 10.0, 10.0, 10.0, 255, 255, 255, 155, 0, 0, 2, nil, nil, false)
                DrawMarker(43, limitMarkerPos.x, limitMarkerPos.y, limitMarkerPos.z-2, vector.x, vector.y, vector.z,
                    0.0, 0.0, 0.0, Config.RaceStartWidth+0.0, Config.DistanteFromRaceStart+0.0, 10.0, 255, 255, 255, 50, 0, 0, 2, nil, nil, false)
                Wait(0)
            end
        end
    end)
end)

RegisterNetEvent("mafiaracing:serverMessage")
AddEventHandler("mafiaracing:serverMessage", function(message)
    ESX.ShowNotification(message)
end)

RegisterNetEvent("mafiaracing:updateRaceState")
AddEventHandler("mafiaracing:updateRaceState", function(race, used)
    if races[race] then
        races[race].used = used
        if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == "mafiarace" then
            SetBlipColour(blips[race], SelectBlipColour(races[race].used))
        end
    end
end)

-- comprobar si hay que terminar la carrera
function CheckEndRace(vehicle, distance, race)
    if (distance > Config.DistanceToEnd) then
        ESX.ShowNotification("Se te ha expulsado de la carrera por alejarte demasiado.")
        TriggerServerEvent("mafiaracing:removeFromRace", GetPlayerServerId(PlayerId()), race)
        return true
    end
    if (vehicle == 0) then
        ESX.ShowNotification("Se te ha expulsado de la carrera por bajar del coche.")
        TriggerServerEvent("mafiaracing:removeFromRace", GetPlayerServerId(PlayerId()), race)
        return true
    end
    if (GetEntityHealth(PlayerPedId()) <= 0) then
        ESX.ShowNotification("Se te ha expulsado de la carrera al haber muerto.")
        TriggerServerEvent("mafiaracing:removeFromRace", GetPlayerServerId(PlayerId()), race)
        return true
    end
    return false
end

-- Dibuja en un frame en la pantalla un texto text, en x, y, centrado o no, de tamaño size, con una fuente font, y un color r, g, b, a.
function Draw2DText(text, x, y, centered, size, font, r, g, b, a)
    SetTextScale(0.0, size)
    SetTextFont(font)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    SetTextCentre(centered)
    SetTextDropShadow()
    AddTextComponentString(text)
    DrawText(x,y)
end

-- tranforma segundos en minutos y segundos
function TimeToString(s)
    local minutes = math.floor(s / 60)
    local seconds = s % 60
    if seconds < 10 then
        return minutes..":0"..seconds
    end
    return minutes..":"..seconds
end

-- muestra el leaderboard actual
function ShowLeaderboard(race)
    local y = 0.3
    for k,v in ipairs(races[race].runners) do 
        if (v.finished) then
            Draw2DText(k.." - "..v.name .. " / " .. TimeToString(v.endtime-v.starttime), 0.01, y, false, 0.5, 4, 0, 255, 0, 255)
        else
            Draw2DText(k.." - "..v.name, 0.01, y, false, 0.5, 4, 255, 255, 255, 255)
        end
        if (v.source == GetPlayerServerId(PlayerId())) then
            Draw2DText(k, 0.9, 0.68, true, 4.0, 4, 255, 255, 255, 255)
            Draw2DText(TimeToString(v.endtime - v.starttime), 0.9, 0.65, true, 1.0, 4, 255, 255, 255, 255)
        end
        y = y + 0.03
    end
    for k,v in ipairs(races[race].drivenout) do
        Draw2DText(k+#races[race].runners.." - "..v.name, 0.01, y, false, 0.5, 4, 255, 0, 0, 255)
        y = y + 0.03
    end
end

RegisterNetEvent("mafiaracing:giveLeaderboard")
AddEventHandler("mafiaracing:giveLeaderboard", function(race, runners, drivenout)
    if races[race] then
        races[race].runners = runners
        races[race].drivenout = drivenout
    end
end)

-- devuelve true si el jugador está dentro del área (aprox) y está en un coche en el asiento principal
function CanRace(race)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    if (vehicle == 0) then
        return false
    end
    if (GetPedInVehicleSeat(vehicle,-1) ~= PlayerPedId()) then
        return false
    end
    local playercoords = GetEntityCoords(PlayerPedId())
    local firstCheckPointPos = races[race].checkpoints[1]
    local secondCheckPointPos = races[race].checkpoints[2]
    local vector = norm(firstCheckPointPos - secondCheckPointPos)
    local distanceToPlane = vector.x*playercoords.x+vector.y*playercoords.y+vector.z*playercoords.z-vector.x*firstCheckPointPos.x-vector.y*firstCheckPointPos.y-vector.z*firstCheckPointPos.z
    if (distanceToPlane < 0 or distanceToPlane > Config.DistanteFromRaceStart) then
        return false
    end
    local proyection = vector3(playercoords.x-vector.x*distanceToPlane, playercoords.y-vector.y*distanceToPlane, playercoords.z-vector.z*distanceToPlane)
    if (#(firstCheckPointPos - proyection) > Config.RaceStartWidth/2) then
        return false
    end
    return distanceToPlane
end

-- gestiona la carrera
RegisterNetEvent("mafiaracing:startRaceClient")
AddEventHandler("mafiaracing:startRaceClient", function(race)
    Citizen.CreateThread(function()

        -- por si acaso no lo ha podido coger cuando el jugador se ha conectado
        if (name == nil) then
            TriggerServerEvent("mafiaracing:getNameServer", GetPlayerServerId(PlayerId()))
        end
        Wait(500)

        local canrace = CanRace(race)
        local vehicle = 0
        local vehiclespeed = 0
        local inrace = canrace and not racing
        if inrace then
            racing = true
            vehicle = GetVehiclePedIsIn(PlayerPedId())
            currentCheckPoint = 1
            distance = canrace
            Citizen.CreateThread(function()
                while racing and races[race].used == 1  do
                    TriggerServerEvent("mafiaracing:raceInformation", GetPlayerServerId(PlayerId()), race, name, currentCheckPoint, distance, false)
                    local v = GetVehiclePedIsIn(PlayerPedId())
                    racing = not CheckEndRace(v, distance, race)
                    Wait(Config.TimeToSendInfo)
                end
                racing = false
            end)
            vehiclespeed = GetVehicleEstimatedMaxSpeed(vehicle)
            SetVehicleMaxSpeed(vehicle, 0.001)
        end

        local number = 15
        local lastnumber = 0

        Citizen.CreateThread(function()
            local firstCheckPointPos = races[race].checkpoints[1]
            local secondCheckPointPos = races[race].checkpoints[2]
            local vector = firstCheckPointPos - secondCheckPointPos
            while number > 10 and races[race].used == 1 do
                DrawMarker(number, firstCheckPointPos.x, firstCheckPointPos.y, firstCheckPointPos.z, vector.x, vector.y, vector.z,
                0.0, 0.0, 0.0, 5.0, 5.0, 5.0, 255, 0, 0, 255, 0, 0, 2, nil, nil, false)    
                if inrace and racing and lastnumber ~= number then
                    PlaySoundFrontend(-1, "CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET")
                end
                lastnumber = number
                Wait(0)
            end
        end)

        Wait(1000)
        number = 14
        Wait(1000)
        number = 13
        Wait(1000)
        number = 12
        Wait(1000)
        number = 11
        Wait(1000)
        number = 10

        if inrace then
            Citizen.CreateThread(function()
                while racing do
                    ShowLeaderboard(race)
                    Wait(0)
                end
            end)
            PlaySoundFrontend(-1, "CHECKPOINT_BEHIND", "HUD_MINI_GAME_SOUNDSET")

            SetVehicleMaxSpeed(vehicle, vehiclespeed)
            
            currentCheckPoint = 2
            local nCheckPoints = #races[race].checkpoints
            
            -- mientras que no sea el final de la carrera
            while racing do
                -- cogemos la posición del checkpoint actual
                currentCheckPointPos = races[race].checkpoints[currentCheckPoint]
                
                -- añadimos el blip
                local blip = AddBlipForCoord(currentCheckPointPos.x, currentCheckPointPos.y, currentCheckPointPos.z)
            
                SetBlipSprite (blip, 1)
                SetBlipDisplay(blip, 4)
                SetBlipScale  (blip, 0.8)
            
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Checkpoint")
                EndTextCommandSetBlipName(blip)
                
                -- si estamos en el último checkpoint hacemos un tratamiento especial
                if (currentCheckPoint == nCheckPoints) then
                    -- ponemos el color gris oscuro a la meta
                    SetBlipColour (blip, 40)
                    -- cogemos la posición del checkpoint anterior
                    local lookingCheckPointPos = races[race].checkpoints[currentCheckPoint-1]
                    -- vector direccion de la meta (mirando al checkpoint anterior)
                    local vector = norm(lookingCheckPointPos-currentCheckPointPos)
                    repeat
                        Wait(0)
                        -- dibujamos el marker cada frame
                        DrawMarker(4, currentCheckPointPos.x, currentCheckPointPos.y, currentCheckPointPos.z+2, vector.x, vector.y, vector.z,
                            0.0, 0.0, 0.0, 10.0, 10.0, 10.0, 0, 0, 0, 155, 0, 0, 2, nil, nil, false)
                        -- cogemos las coordenadas del jugador
                        local playercoords = GetEntityCoords(PlayerPedId())
                        -- cogemos el vehículo
                        local vehicle = GetVehiclePedIsIn(PlayerPedId())
                        -- distancia al plano de la meta
                        distance = vector.x*playercoords.x+vector.y*playercoords.y+vector.z*playercoords.z-vector.x*currentCheckPointPos.x-vector.y*currentCheckPointPos.y-vector.z*currentCheckPointPos.z+GetModelDimensions(GetEntityModel(vehicle)).y 
                        -- distancia a la posición de la meta
                        local distance2 = GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, currentCheckPointPos.x, currentCheckPointPos.y, currentCheckPointPos.z, true)
                    until (distance < 0 and distance2 < Config.DistanteToValid) or not racing
                    -- si se acaba el bucle y no se ha acabado la carrera hemos terminado la carrera
                    if (racing) then
                        Wait(0)
                        TriggerServerEvent("mafiaracing:raceInformation", GetPlayerServerId(PlayerId()), race, name, currentCheckPoint, 0, true)
                        PlaySoundFrontend(-1, "ScreenFlash", "WastedSounds")
                        for k,v in ipairs(races[race].runners) do
                            if (v.source == GetPlayerServerId(PlayerId())) then
                                Citizen.CreateThread(function()
                                    local iterations = 200
                                    while iterations > 0 do
                                        Draw2DText("~g~¡Has quedado el ~w~".. k .. "~g~!", 0.5, 0.4, true, 4.0, 4, 255, 255, 255, 255)
                                        iterations = iterations - 1
                                        Wait(0)
                                    end
                                end)
                            end
                        end
                        racing = false
                    end
                else
                    -- ponemos el color rojo al checkpoint
                    SetBlipColour (blip, 1)
                    -- cogemos la posición del checkpoint siguiente
                    local lookingCheckPointPos = races[race].checkpoints[currentCheckPoint+1]
                    -- creamos el checkpoint
                    CheckPoint = CreateCheckpoint(0, currentCheckPointPos.x, currentCheckPointPos.y, currentCheckPointPos.z-2,
                        lookingCheckPointPos.x, lookingCheckPointPos.y, lookingCheckPointPos.z, 6.0, 255, 0, 0, 55, 0)
                    repeat
                        Wait(0)
                        -- cogemos las coordenadas del jugador
                        local playercoords = GetEntityCoords(PlayerPedId())
                        -- cogemos el vehículo
                        local vehicle = GetVehiclePedIsIn(PlayerPedId())
                        -- distancia al checkpoint
                        distance = GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, currentCheckPointPos.x, currentCheckPointPos.y, currentCheckPointPos.z, true)
                    until distance < Config.DistanteToValid or not racing
                    -- si se acaba el bucle y no se ha acabado la carrera pasamos al siguiente checkpoint
                    if (racing) then
                        currentCheckPoint = currentCheckPoint + 1
                        PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
                    end
                    -- quitamos el checkpoint
                    DeleteCheckpoint(CheckPoint)
                end
                -- quitamos el blip
                RemoveBlip(blip)
            end
            racing = false
        end
    end)
end)

function OpenRankingRace()
    elements = {}
    for k,v in ipairs(races[selected].runners) do
        table.insert(elements, {label = k .. " - ".. v.name .. " " .. TimeToString(v.endtime-v.starttime)})
    end
    for k,v in ipairs(races[selected].drivenout) do
        table.insert(elements, {label = k + #races[selected].runners .. " - " .. v.name .. " -"})
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafiarace_ranking', {
		title    = 'Último ranking de ' .. selected,
		align    = 'top-left',
		elements = elements
	}, function()
	end, function(data, menu)
		menu.close()
	end)
end

function OpenUseRace()
    elements = {
        {label = "Crear lobby"},
        {label = "Cerrar lobby"},
        {label = "Empezar carrera"},
        {label = "Terminar carrera"},
        {label = "Clasificación última carrera"}
    }

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafiarace_userace', {
		title    = 'Gestión de carrera',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

        if races[selected] then
            if data.current.label == "Crear lobby" then
                TriggerServerEvent("mafiaracing:createLobbyServer", GetPlayerServerId(PlayerId()), selected)
            elseif data.current.label == "Cerrar lobby" then
                TriggerServerEvent("mafiaracing:closeLobbyServer", GetPlayerServerId(PlayerId()), selected)
            elseif data.current.label == "Empezar carrera" then
                TriggerServerEvent("mafiaracing:startRaceServer", GetPlayerServerId(PlayerId()), selected)
            elseif data.current.label == "Terminar carrera" then
                TriggerServerEvent("mafiaracing:endRaceServer", GetPlayerServerId(PlayerId()), selected)
            else
                if races[selected].runners then
                    if races[selected].used ~= 1 then
                        OpenRankingRace()
                    else
                        ESX.ShowNotification("~r~Hay una carrera activa.")
                    end
                else
                    ESX.ShowNotification("~r~La clasificación esta vacía.")
                end
            end
        else
            ESX.ShowNotification("~r~Esta carrera ya no existe.")
        end

	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent("mafiaracing:updateRaceClient")
AddEventHandler("mafiaracing:updateRaceClient", function(race, content)
    races[race] = content
    if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == "mafiarace" then
        RemoveBlip(blips[race])
        if content ~= nil then
            blips[race] = AddBlipForCoord(races[race].checkpoints[1].x, races[race].checkpoints[1].y, races[race].checkpoints[1].z)
                
            SetBlipSprite (blips[race], 38)
            SetBlipDisplay(blips[race], 4)
            SetBlipScale  (blips[race], 0.8)
            SetBlipAsShortRange(blips[race], true)
            SetBlipColour(blips[race], SelectBlipColour(races[race].used))

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(race)
            EndTextCommandSetBlipName(blips[race])
        end
    end
end)

function OpenAreYouSure()
    local elements = {
		{label = "Si"},
        {label = "No"}
    }

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafiarace_areyousure', {
		title    = '¿Seguro que quieres eliminar ' .. selected .. '?',
		align    = 'top-left',
		elements = elements
    }, function(data, menu)
        
        if data.current.label == "Si" then
            TriggerServerEvent("mafiaracing:updateRaceServer", selected, nil)
            ESX.ShowNotification("~g~Has eliminado la carrera ~b~" .. selected .. "~g~.")
        else
            menu.close()
        end

	end, function(data, menu)
		menu.close()
    end)
end

function OpenEditRace()
    local elements = {
		{label = "Añadir punto"},
        {label = "Quitar el último punto"},
        {label = "Guardar cambios"},
        {label = "Eliminar carrera"}
    }

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafiarace_editrace', {
		title    = 'Editor de carrera',
		align    = 'top-left',
		elements = elements
    }, function(data, menu)
        
        if races[selected] then
            if data.current.label == "Añadir punto" then
                table.insert(races[selected].checkpoints, GetEntityCoords(PlayerPedId()))
                if #races[selected].checkpoints == 1 then
                    blips[selected] = AddBlipForCoord(races[selected].checkpoints[1].x, races[selected].checkpoints[1].y, races[selected].checkpoints[1].z)
                    
                    SetBlipSprite (blips[selected], 38)
                    SetBlipDisplay(blips[selected], 4)
                    SetBlipScale  (blips[selected], 0.8)
                    SetBlipAsShortRange(blips[selected], true)
                    SetBlipColour(blips[selected], SelectBlipColour(races[selected].used))
    
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(selected)
                    EndTextCommandSetBlipName(blips[selected])
                end
                ESX.ShowNotification("~g~Has añadido un punto a ~b~" .. selected .. "~g~.")
                PlaySoundFrontend(-1, "CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET")
            elseif data.current.label == "Quitar el último punto" then
                if #races[selected].checkpoints > 0 then
                    if #races[selected].checkpoints == 1 then
                        ESX.ShowNotification("~g~Ya no quedan más checkpoints.")
                        RemoveBlip(blips[selected])
                    end
                    table.remove(races[selected].checkpoints, #races[selected].checkpoints)
                    ESX.ShowNotification("~g~Has eliminado un punto de ~b~" .. selected .. "~g~.")
                    PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
                else
                    ESX.ShowNotification("~r~No hay ningún punto que quitar.")
                end
            elseif data.current.label == "Guardar cambios" then
                TriggerServerEvent("mafiaracing:updateRaceServer", selected, races[selected], GetPlayerServerId(PlayerId()))
                ESX.ShowNotification("~g~Guardando los cambios de la carrera ~b~" .. selected .. "~g~...")
            else
                OpenAreYouSure()
            end     
        else
            ESX.ShowNotification("~r~Esta carrera ya no existe.")
        end

	end, function(data, menu)
		menu.close()
	end, function()
    end, function()
        if races[selected] then
            TriggerServerEvent("mafiaracing:usedState", selected, nil)
        end
    end)
end

function OpenExistingRaces()
    elements = {}
    for k,v in pairs(races) do
        table.insert(elements, {label = k})
    end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafiarace_existingrace', {
		title    = 'Selecciona una carrera',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
        selected = data.current.label
        if races[selected] then
            if (editing == 0) then
                OpenUseRace()
            else
                if not races[selected].used then
                    TriggerServerEvent("mafiaracing:usedState", selected, 2)
                    OpenEditRace()
                else
                    ESX.ShowNotification("~r~La carrera está siendo utilizada.")
                end
            end
        else
            ESX.ShowNotification("~r~Esta carrera ya no está disponible.")
        end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenSelectExistingOrNew()
    local elements = {
		{label = "Editar una carrera existente"},
		{label = "Crear una nueva carrera"}
    }

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafiarace_existingornew', {
		title    = 'Selecciona una opción',
		align    = 'top-left',
		elements = elements
    }, function(data, menu)
        
        if data.current.label == "Editar una carrera existente" then
            OpenExistingRaces()
        else
            DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
            input = true
            Citizen.CreateThread(function()
                while input do
                    if input == true then
                        HideHudAndRadarThisFrame()
                        if UpdateOnscreenKeyboard() == 3 then
                            input = false
                        elseif UpdateOnscreenKeyboard() == 1 then
                            local inputText = GetOnscreenKeyboardResult()
                            if string.len(inputText) > 0 then
                                if string.len(inputText) > 30 then
                                    ESX.ShowNotification("~r~El nombre es demasiado grande. (máximo 30 caracteres)")
                                else
                                    if races[inputText] ~= nil then
                                        ESX.ShowNotification("~r~Ese nombre ya está en uso")
                                    else
                                        local playercoords = GetEntityCoords(PlayerPedId())
                                        races[inputText] = {
                                            checkpoints = {
                                                vector3(playercoords.x,playercoords.y,playercoords.z)
                                            }
                                        }
                                        TriggerServerEvent("mafiaracing:updateRaceServer", inputText, races[inputText])
                                        ESX.ShowNotification("~g~Has creado una carrera con el primer checkpoint en tu posición actual.")
                                    end
                                end
                                input = false
                            else
                                DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
                            end
                        elseif UpdateOnscreenKeyboard() == 2 then
                            input = false
                        end
                    end
                    Wait(0)
                end
            end)
        end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenMafiaRaceMenu()
	local elements = {
		{label = "Gestionar una carrera"},
		{label = "Editor de carreras"}
    }

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafiarace_actions', {
		title    = 'Mafia de carreras',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

        if data.current.label == "Gestionar una carrera" then
            editing = 0
			OpenExistingRaces()
        else
            editing = 1
            OpenSelectExistingOrNew()
		end

	end, function(data, menu)
		menu.close()
	end)
end

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if IsControlJustReleased(1, 57) and ESX.PlayerData.job2 and ESX.PlayerData.job2.name == "mafiarace" then
            OpenMafiaRaceMenu()
        end
	end
end)
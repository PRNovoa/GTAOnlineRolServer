-- costantes que se necesitan para la función que convierte la puntuación de un jugador en el valor de sus votos
alpha = math.log(1/(Config.Multiplier-1))
beta = (math.log(19)-alpha)/Config.GoodLevel
e = 2.71828

-- función que convierte la puntuación de un jugador en el valor de sus votos
function sigmoid(rolelevel)
    return 1-1/(1+e^(rolelevel*beta+alpha))
end

-- constantes para poner delay a los votos
TimeBetweenAny = Config.TimeBetweenAny*60
TimeBetweenSame = Config.TimeBetweenSame*60*60

-- constante para determinar el tiempo de vida de los votos guardados en rolevotes
VoteTimeLife = Config.VoteTimeLife*24*60*60

-- borra todos los votos que ya hayan cumplido con su tiempo de vida
MySQL.Async.execute("DELETE FROM rolevotes WHERE tiempo < @time",     
{["time"] = os.time() - VoteTimeLife},
function()
end)

-- guarda los votos y rolelevels de los jugadores que están conectados
votes = {}
rolelevels = {}

-- devuelve la licencia de rockstar del jugador con cierta id
function getIdentifier(playerId)
    for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			return string.sub(v, 9)
		end
	end
end

RegisterNetEvent("rolelevel")
AddEventHandler("rolelevel", function()
    local src = source
    local identifier = getIdentifier(source)
    MySQL.Async.fetchAll('SELECT rolelevel FROM users WHERE identifier = @id',
    { ['@id'] = identifier},
    function(result)
        local points = 0
        if (#result ~= 0) then
            points = result[1].rolelevel
            print(result[1])
            print(result[1].rolelevel)
        end
        TriggerClientEvent("rolelevel:response", src, points)
        table.insert(rolelevels, {source = identifier, rolelevel = points})
    end)
end)

-- añade a votes los votos que ha hecho este jugador
AddEventHandler("playerConnecting", function()
    MySQL.Async.fetchAll('SELECT * FROM rolevotes WHERE emisor = @id AND tiempo > @time',
    { ['@id'] = getIdentifier(source), ['@time'] = os.time() - TimeBetweenSame},
    function(result)
        for k,v in ipairs(result) do
            table.insert(votes, {emisor = v.emisor, receptor = v.receptor, tiempo = v.tiempo})
        end
    end)
end)

-- quita de votes los votos que ha hecho este jugador
AddEventHandler("playerDropped", function()
    local identifier = getIdentifier(source)
    for k,v in ipairs(votes) do
        if identifier == v.emisor then
            table.remove(votes, k)
        end
    end
    local i = 1
    local found = false
    while i <= #rolelevels and not found do
        if rolelevels[i].source == identifier then
            table.remove(rolelevels, i)
            found = true
        end
        i = i + 1
    end
end)

-- añade la puntuación al jugador correspondiente y añade una fila en rolevotes (op: 1 -> sumar, -1 -> restar)
function addVote(sourceidentifier, targetidentifier, text, op)
    -- recoge la puntuación del emisor
    MySQL.Async.fetchAll('SELECT rolelevel FROM users WHERE identifier = @id',
    { ['@id'] = sourceidentifier},
    function(result)
        -- añade la puntuación al receptor
        votevalue = op*sigmoid(result[1].rolelevel)

        local i = 1
        local found = false
        while i <= #rolelevels and not found do
            if rolelevels[i].source == targetidentifier then
                rolelevels[i].rolelevel = rolelevels[i].rolelevel + votevalue
                found = true
            end
            i = i + 1
        end

        MySQL.Async.execute('UPDATE users SET rolelevel = rolelevel + @value WHERE identifier = @id',
        {["value"] = votevalue, ['id'] = targetidentifier},
        function()
        end)
        -- añade el voto a rolevotes
        MySQL.Async.execute("INSERT INTO rolevotes (emisor, receptor, tiempo, voto, justificacion) VALUES(@sourceidentifier, @targetidentifier, @time, @value, @text)",     
        {["sourceidentifier"] = sourceidentifier, ["targetidentifier"] = targetidentifier, ["time"] = os.time(), ["value"] = votevalue, ["text"] = text},
        function()
        end)
    end)

    table.insert(votes, {emisor = sourceidentifier, receptor = targetidentifier, tiempo = os.time()})

end

-- permite el voto o no si ha pasado suficiente tiempo
function checkTime(source, target, text, op)
    -- identificadores del emisor y el receptor del voto
    sourceidentifier = getIdentifier(source)
    targetidentifier = getIdentifier(target)

    local i = 1
    local canVoteSame = true
    local canVoteAny = true
    while i <= #votes and canVoteSame do
        if votes[i].emisor == sourceidentifier and votes[i].receptor == targetidentifier and votes[i].tiempo + TimeBetweenSame > os.time() then
            canVoteSame = false
        end
        if votes[i].emisor == sourceidentifier and votes[i].tiempo + TimeBetweenAny > os.time() then
            canVoteAny = false
        end
        i = i + 1
    end

    if canVoteSame then

        if canVoteAny then
            addVote(sourceidentifier, targetidentifier, text, op)
            -- avisa al jugador de que su voto ha sido enviado
            local feedback = "Tu voto ha sido enviado correctamente."
            if (text == "") then
                feedback = feedback .. " Recomendamos justificar el voto para evitar problemas."
            end
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0},
                multiline = true,
                args = {"[ROLELEVEL]", feedback}
            })
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0},
                multiline = true,
                args = {"[ROLELEVEL]", "Tienes que esperar " .. Config.TimeBetweenAny .. " minutos para poder votar a cualquier jugador."}
            })
        end

    else
        -- avisa al jugador de que tiene que esperar para poder votar a esa persona en específico
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[ROLELEVEL]", "Tienes que esperar " .. Config.TimeBetweenSame .. " horas para poder votar al mismo jugador."}
        })
    end
end

-- devuelve el texto que justifica la votación
function getText(args)
    local text = ""
    local size = #args
    local i = 2
    while i <= size do
        text = text .. " " .. args[i]
        i = i + 1
    end
    return text
end

-- hace todas las comprobaciones y añade la puntuación al jugador correspondiente y añade una fila en rolevotes si procede (op: 1 -> sumar, -1 -> restar)
function vote(source, args, op)
    local target = args[1]
    -- comprueba que la ID es válida
    if (target ~= nil and GetPlayerName(target) ~= nil) then
        -- comprueba que no se quiera votar a él mismo
        if (tonumber(source) == tonumber(target)) then
            -- avisa al jugador de que no puede hacer eso
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0},
                multiline = true,
                args = {"[ROLELEVEL]", "No puedes votarte a ti mismo."}
            })
        else
            -- comprueba que los jugadores estén lo suficientemente cerca
            local sourcecoords = GetEntityCoords(GetPlayerPed(source))
            local targetcoords = GetEntityCoords(GetPlayerPed(target))
            if (#(sourcecoords-targetcoords) < Config.MaxDistance) then
                local text = getText(args)
                if (string.len(text) > 160) then
                    -- avisa al jugador de que la justificación no puede tener más de 160 caracteres
                    TriggerClientEvent('chat:addMessage', source, {
                        color = { 255, 0, 0},
                        multiline = true,
                        args = {"[ROLELEVEL]", "La justificación no puede tener más de 160 caracteres. Recuerda que una vez abierto el chat, si pulsas la flecha hacia arriba del teclado, podrás recuperar tu mensaje."}
                    })
                else
                    -- permite el voto o no si ha pasado suficiente tiempo
                    checkTime(source, target, text, op)
                end
            else
                -- avisa al jugador de que no está lo suficientemente cerca
                TriggerClientEvent('chat:addMessage', source, {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"[ROLELEVEL]", "No estás lo suficientemente cerca de ese jugador."}
                })
            end
        end
    else
        -- avisa al jugador de que la ID no es válida
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[ROLELEVEL]", "No se ha encontrado el jugador con esa ID."}
        })
    end
end

-- permite al jugador votar positivamente a un jugador
RegisterCommand('positivo', function(source, args) vote(source, args, 1) end, true)

-- permite al jugador votar negativamente a un jugador
RegisterCommand('negativo', function(source, args) vote(source, args, -1) end, true)

-- permite ver el rolelevel de un jugador (necesita permisos)
RegisterCommand('rolelevel', function(source, args)
    local target = args[1]
    -- comprueba que la ID es válida
    if (target ~= nil and GetPlayerName(target) ~= nil) then
        local targetidentifier = getIdentifier(target)

        local i = 1
        local found = false
        while i <= #rolelevels and not found do
            if rolelevels[i].source == targetidentifier then
                -- muestra al jugador el rolelevel del target
                local points = ""
                if (rolelevels[i].rolelevel < 0) then
                    points = "^1" .. rolelevels[i].rolelevel
                else
                    points = "^2" .. rolelevels[i].rolelevel
                end
                TriggerClientEvent('chat:addMessage', source, {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"[ROLELEVEL]", "El rolelevel de ^4".. targetidentifier .. "^0 es ".. points .. "^0."}
                })
                found = true
            end
            i = i + 1
        end
        
        if not found then
            -- recoge la puntuación del jugador
            MySQL.Async.fetchAll('SELECT rolelevel FROM users WHERE identifier = @id',
            { ['@id'] = targetidentifier},
            function(result)
                -- muestra al jugador el rolelevel del target
                local points = ""
                if (result[1].rolelevel < 0) then
                    points = "^1" .. result[1].rolelevel
                else
                    points = "^2" .. result[1].rolelevel
                end
                TriggerClientEvent('chat:addMessage', source, {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"[ROLELEVEL]", "(Se ha recogido de la base de datos por un error) El rolelevel de ^4".. targetidentifier .. "^0 es ".. points .. "^0."}
                })
            end)
        end
    else
        -- avisa al jugador de que la ID no es válida
        TriggerClientEvent('chat:addMessage', source, {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[ROLELEVEL]", "No se ha encontrado el jugador con esa ID."}
        })
    end
end, true)

-- configura los permisos
for k,v in ipairs(groups) do
    ExecuteCommand("remove_ace group." .. v .. " command.positivo allow")
    ExecuteCommand("remove_ace group." .. v .. " command.negativo allow")
    ExecuteCommand("remove_ace group." .. v .. " command.rolelevel allow")
end

ExecuteCommand("add_ace group." .. Config.VotePerm .. " command.positivo allow")
ExecuteCommand("add_ace group." .. Config.VotePerm .. " command.negativo allow")
ExecuteCommand("add_ace group." .. Config.SeeRoleLevelPerm .. " command.rolelevel allow")
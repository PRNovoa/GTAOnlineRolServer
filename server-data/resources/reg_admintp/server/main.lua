function SendMessage(id, message)
    TriggerClientEvent('chat:addMessage', id, {
        color = { 0, 255, 255},
        multiline = true,
        args = {"[ADMINTP]", message}
    })
end

RegisterCommand("bring", function(source, args)
    local target = args[1]
    if (target ~= nil and GetPlayerName(target) ~= nil) then
        if tonumber(target) == source then
            SendMessage(source, "^1¿Para qué te querrías teletransportar a tu posición?")
        else    
            --SendMessage(target, "^2Has sido teletransportado al jugador con ID ^5" .. source .. "^2.")
            SendMessage(source, "^2Has teletransportado al jugador con ID ^5" .. target .. "^2 a tu posición.")
            TriggerClientEvent("admintp:teleport", target, source)
        end
    else
        if target then
            SendMessage(source, "^1No se ha encontrado a ningún jugador con ID ^5" .. target .. "^1.")
        else
            SendMessage(source, "^1Se necesita la ID de un jugador.")
        end
    end
end, true)

RegisterCommand("goto", function(source, args)
    local target = args[1]
    if (target ~= nil and GetPlayerName(target) ~= nil) then
        if tonumber(target) == source then
            SendMessage(source, "^1¿Para qué te querrías teletransportar a tu posición?")
        else    
            SendMessage(source, "^2Te has teletransportado al jugador con ID ^5" .. target .. "^2.")
            --SendMessage(target, "^2Se ha teletransportado el jugador con ID ^5" .. source .. "^2 a tu posición.")
            TriggerClientEvent("admintp:teleport", source, tonumber(target))
        end
    else
        if target then
            SendMessage(source, "^1No se ha encontrado a ningún jugador con ID ^5" .. target .. "^1.")
        else
            SendMessage(source, "^1Se necesita la ID de un jugador.")
        end
    end
end, true)

-- configura los permisos
for k,v in ipairs(groups) do
    ExecuteCommand("remove_ace group." .. v .. " command.bring allow")
    ExecuteCommand("remove_ace group." .. v .. " command.goto allow")
end

ExecuteCommand("add_ace group." .. Config.TpPerm .. " command.bring allow")
ExecuteCommand("add_ace group." .. Config.TpPerm .. " command.goto allow")
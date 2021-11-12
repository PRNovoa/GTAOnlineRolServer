ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('twt', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args == 0 then
        xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
    else
        local name = xPlayer.getName()
        local message = table.concat(args, " ")
        local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> {0}: {1}</div>'
        TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
    end
end, false)

RegisterCommand('ayuda', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args == 0 then
        xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
    else
        local name = xPlayer.getName()  .. " [" .. source .. "]"
        local message = table.concat(args, " ")
        local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(214, 168, 0, 0.8); border-radius: 10px;"><i class="fas fa-hands-helping"></i> {0}: {1}</div>'
        TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
    end
end, false)

RegisterCommand('me', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args == 0 then
        xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
    else
        local name = xPlayer.getName()  .. " [" .. source .. "]"
        local message = table.concat(args, " ")
        local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(255, 147, 0, 0.6); border-radius: 10px;"><i class="fas fa-user"></i> {0}: {1}</div>'
        TriggerClientEvent('reg_rpchat:proximityMessage', -1, source, name, message, template, 1)
    end
end, false)

RegisterCommand('do', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args == 0 then
        xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
    else
        local name = xPlayer.getName() .. " [" .. source .. "]"
        local message = table.concat(args, " ")
        local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(158, 61, 255, 0.8); border-radius: 10px;"><i class="fas fa-cloud"></i> {0}: {1}</div>'
        TriggerClientEvent('reg_rpchat:proximityMessage', -1, source, name, message, template, 2)
    end
end, false)


RegisterCommand('anontwt', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args == 0 then
        xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
    else
        local name = "Anónimo"
        local message = table.concat(args, " ")
        local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> {0}: {1}</div>'
        TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
    end
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args == 0 then
        xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
    else
        local name = "Anuncio"
        local message = table.concat(args, " ")
        local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 10px;"><i class="fas fa-ad"></i> {0}: {1}<br></div>'
        TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
    end
end, false)

RegisterCommand('ooc', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args == 0 then
        xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
    else
        local name = xPlayer.getName()  .. " [" .. source .. "]"
        local message = table.concat(args, " ")
        local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 10px;"><i class="fas fa-globe"></i> {0}: {1}</div>'
        TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
    end
end, false)

RegisterCommand('policia', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    if job and job.name == "police" then
        if #args == 0 then
            xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
        else
            local name = "Policía"
            local message = table.concat(args, " ")
            local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(50, 204, 255, 0.6); border-radius: 10px;"><i class="fas fa-shield-alt"></i> {0}: {1}</div>'
            TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
        end
    else
        xPlayer.showNotification("~r~¡No eres policía!")
    end
end, false)

RegisterCommand('taxi', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    if job and job.name == "taxi" then
        if #args == 0 then
            xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
        else
            local name = "Taxi"
            local message = table.concat(args, " ")
            local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(255, 255, 0, 0.8); border-radius: 10px;"><i class="fas fa-taxi"></i> {0}: {1}</div>'
            TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
        end
    else
        xPlayer.showNotification("~r~¡No eres taxista!")
    end
end, false)

RegisterCommand('mecanico', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    if job and job.name == "mechanic" then
        if #args == 0 then
            xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
        else
            local name = "Mecánico"
            local message = table.concat(args, " ")
            local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(220, 0, 255, 0.6); border-radius: 10px;"><i class="fas fa-wrench"></i> {0}: {1}</div>'
            TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
        end
    else
        xPlayer.showNotification("~r~¡No eres mecánico!")
    end
end, false)

RegisterCommand('samur', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    if job and job.name == "ambulance" then
        if #args == 0 then
            xPlayer.showNotification("~r~¡No puedes enviar un mensaje vacío!")
        else
            local name = "SAMUR"
            local message = table.concat(args, " ")
            local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(190, 0, 0, 0.8); border-radius: 10px;"><i class="fas fa-ambulance"></i> {0}: {1}</div>'
            TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
        end
    else
        xPlayer.showNotification("~r~¡No trabajas en el hospital!")
    end
end, false)


RegisterNetEvent("reg_rpchat:ooclocal")
AddEventHandler("reg_rpchat:ooclocal", function(source, message)
    local xPlayer = ESX.GetPlayerFromId(tonumber(source))
    local name = xPlayer.getName()  .. " [" .. source .. "]"
    local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 10px;"><i class="fas fa-street-view"></i> {0}: {1}</div>'
    TriggerClientEvent('reg_rpchat:proximityMessage', -1, source, name, message, template)
end)

RegisterNetEvent('reg_rpchat:join')
AddEventHandler('reg_rpchat:join', function(src)
    local xPlayer = ESX.GetPlayerFromId(tonumber(src))
    local name
    local message
    local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(0, 214, 10, 0.8); border-radius: 10px;"><i class="fas fa-sign-in-alt"></i> {0} {1}</div>'
    name = xPlayer.getName()
    if name ~= GetPlayerName(src) then
        message = "se ha despertado"
    else
        name = GetPlayerName(src)
        message = "ha llegado a la ciudad, está haciéndose el DNI"
    end
    TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
end)

RegisterNetEvent('reg_rpchat:dropped')
AddEventHandler('reg_rpchat:dropped', function(src, reason)
    local xPlayer = ESX.GetPlayerFromId(tonumber(src))
    local name
    local message
    local template = '<div style="padding: 0.3vw; margin: 0.4vw; background-color: rgba(255, 127, 223, 0.8); border-radius: 10px;"><i class="fas fa-sign-out-alt"></i>{0} {1}</div>'
    name = xPlayer.getName() 
    if name ~= GetPlayerName(src) then
        message = "se ha ido a dormir"
    else
        name = GetPlayerName(src)
        message = "se le ha olvidado hacerse el DNI"
    end
    TriggerClientEvent('reg_rpchat:globalMessage', -1, name, message, template)
end)
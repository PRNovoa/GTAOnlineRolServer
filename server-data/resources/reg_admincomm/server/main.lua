TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

RegisterCommand("kick", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "admin" or group == "superadmin" then
        if #args == 0 then
            xPlayer.showNotification("~r~Se necesita la ID del jugador")    
        else
            local target = ESX.GetPlayerFromId(args[1])
            if target == nil then
                xPlayer.showNotification("~r~No se ha encontrado a ningún jugador con esa ID")
            else
                target.kick(getText(args))
                xPlayer.showNotification("~g~Has kickeado a " .. target.getName())
            end
        end
    else
        xPlayer.showNotification("~r~No tienes permisos para usar este comando")
    end
end)

RegisterCommand("freeze", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "admin" or group == "superadmin" then
        if #args == 0 then
            xPlayer.showNotification("~r~Se necesita la ID del jugador")    
        else
            local target = ESX.GetPlayerFromId(args[1])
            if target == nil then
                xPlayer.showNotification("~r~No se ha encontrado a ningún jugador con esa ID")
            else
                target.triggerEvent("reg_admincomm:freeze")
                xPlayer.showNotification("~g~Has congelado/descongelado a " .. target.getName())
            end
        end
    else
        xPlayer.showNotification("~r~No tienes permisos para usar este comando")
    end
end)

RegisterCommand("crash", function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if group == "admin" or group == "superadmin" then
        if #args == 0 then
            xPlayer.showNotification("~r~Se necesita la ID del jugador")    
        else
            local target = ESX.GetPlayerFromId(args[1])
            if target == nil then
                xPlayer.showNotification("~r~No se ha encontrado a ningún jugador con esa ID")
            else
                target.triggerEvent("reg_admincomm:crash")
                xPlayer.showNotification("~g~Has crasheado a " .. target.getName())
            end
        end
    else
        xPlayer.showNotification("~r~No tienes permisos para usar este comando")
    end
end)

local show = {}
local names = {}

RegisterCommand("tag", function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local group = xPlayer.getGroup()
    if group == "admin" or group == "superadmin" then
        local msg = table.concat(args, " ")
        if msg == "" then msg = "~r~ADMIN" end
        if show[src] then
            show[src] = nil
            names[src] = nil
            xPlayer.showNotification("~g~Has escondido el tag")
        else
            show[src] = true
            names[src] = msg
            xPlayer.showNotification("~g~Has mostrado el tag")
        end
        TriggerClientEvent("reg_admincomm:tag", -1, src, msg, show[src])
    else
        xPlayer.showNotification("~r~No tienes permisos para usar este comando")
    end
end)

RegisterNetEvent("reg_admincomm:gettag")
AddEventHandler("reg_admincomm:gettag", function()
    local src = source
    TriggerClientEvent("reg_admincomm:givetag", src, show, names)
end)

AddEventHandler('playerDropped', function()
    local src = source
    show[src] = nil
    names[src] = nil
end)

RegisterCommand("god", function(source, args)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local group = xPlayer.getGroup()
    if group == "admin" or group == "superadmin" then
        TriggerClientEvent("reg_admincomm:god", src)
    else
        xPlayer.showNotification("~r~No tienes permisos para usar este comando")
    end
end)

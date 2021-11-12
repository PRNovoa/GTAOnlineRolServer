ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('chat:addSuggestion', '/kick', 'Kickea a un jugador', {
    { name="ID", help="ID del jugador que quieres kickear" },
    { name="justificación", help="¿Por qué lo echas?" }
})

TriggerEvent('chat:addSuggestion', '/freeze', 'Congela/descongela a un jugador', {
    { name="ID", help="ID del jugador que congelar/descongelar" }
})

TriggerEvent('chat:addSuggestion', '/crash', 'Crashea el juego a un jugador', {
    { name="ID", help="ID del jugador que crashear" }
})

TriggerEvent('chat:addSuggestion', '/tag', 'Muestra/esconde un tag', {
    { name="tag", help="tag a mostrar" }
})

TriggerEvent('chat:addSuggestion', '/god', 'Activa/desactiva el modo god', {
})

local freeze = false
local tag = false
local show = {}
local god = false

RegisterNetEvent("reg_admincomm:freeze")
AddEventHandler("reg_admincomm:freeze", function()
    freeze = not freeze
    FreezeEntityPosition(PlayerPedId(), freeze)
end)

RegisterNetEvent("reg_admincomm:crash")
AddEventHandler("reg_admincomm:crash", function()
    while true do end
end)

function showTag(src, message)
    Citizen.CreateThread(function()
        local targetped = GetPlayerPed(GetPlayerFromServerId(src))
        local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(targetped))
        local msg = message
        Citizen.CreateThread(function()
            while show[src] and targetped ~= 0 do
                targetped = GetPlayerPed(GetPlayerFromServerId(src))
                if targetped ~= 0 and distance < Config.Distance then
                    ESX.Game.Utils.DrawText3D(GetEntityCoords(targetped) + vector3(0,0,1.06), msg, 1.0, 4)
                end
                Wait(0)
            end
            if targetped == 0 then
                show[src] = nil
            end
        end)
        Citizen.CreateThread(function()
            while show[src] and targetped ~= 0 do
                if targetped ~= 0 then
                    distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(targetped))
                end
                Wait(500)
            end
        end)
    end)
end

RegisterNetEvent("reg_admincomm:tag")
AddEventHandler("reg_admincomm:tag", function(src, msg, t)
    show[src] = t
    if t then
        showTag(src, msg)
    end
end)

Citizen.SetTimeout(3000, function()
    TriggerServerEvent("reg_admincomm:gettag")
end)

RegisterNetEvent("reg_admincomm:givetag")
AddEventHandler("reg_admincomm:givetag", function(s, names)
    show = s
    for k, v in pairs(show) do
        showTag(k, names[k])
    end  
end)

RegisterNetEvent("reg_admincomm:god")
AddEventHandler("reg_admincomm:god", function()
    god = not god
    if god then
        ESX.ShowNotification("~g~Has activado el modo god")
    else
        ESX.ShowNotification("~g~Has desactivado el modo god")
    end
    SetEntityInvincible(PlayerPedId(), god)
end)
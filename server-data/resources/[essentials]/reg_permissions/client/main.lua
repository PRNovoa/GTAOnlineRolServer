-- cuando haya hecho el primer spawn se le muestra al jugador su rolelevel
--[[ready = false
RegisterNetEvent('permissionstatus')
AddEventHandler('permissionstatus', function(text)
    Citizen.CreateThread(function()
        while not ready do
            Wait(500)
        end
        TriggerEvent('chat:addMessage', {
            color = { 0, 255, 0},
            multiline = true,
            args = {"[PERMISSIONS]", text}
        })
    end)
end)

AddEventHandler("playerSpawned", function(spawn)
    ready = true
 end)
]]
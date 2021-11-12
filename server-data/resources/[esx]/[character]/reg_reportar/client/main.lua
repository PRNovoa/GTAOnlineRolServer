-- Cosas de ESX
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	ESX.PlayerData = ESX.GetPlayerData()

end)

TriggerEvent('chat:addSuggestion', '/reportar', 'Reporta una situación para que un admin pueda atenderte', {
    { name="justificación", help="Explica qué ha pasado y dando IDs si fuera necesarios de más personas involucradas" }
})


group = "user"

Citizen.CreateThread(function()
    Wait(2000)
    TriggerServerEvent("reportar:permissionServer")
end)

RegisterNetEvent("reportar:permissionClient")
AddEventHandler("reportar:permissionClient", function(permgroup)
    group = permgroup
end)


RegisterNetEvent("reportar:showClient")
AddEventHandler("reportar:showClient", function(name, source, reporte)
    if group == "admin" then
        TriggerEvent('chat:addMessage', {
            color = { 255, 255, 0},
            multiline = true,
            args = {"[REPORTE]", "^1Nombre: ^7" .. name .. "^4| ^1ID: ^7" .. source .. "^4| ^1reporte: ^7" .. reporte}
        })
    end
end)

RegisterCommand("reportar", function(source, args)
    if #args == 0 then
        ESX.ShowNotification("~r~No puedes enviar reportes vacios")
    else        
        local reporte = table.concat(args, " ")
        ESX.ShowNotification("~g~Has enviado el reporte correctamente")
        TriggerServerEvent("reportar:showServer", reporte)
    end
end, false)
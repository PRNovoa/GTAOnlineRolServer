RegisterServerEvent('pk_bus:cobrarDinero')
AddEventHandler('pk_bus:cobrarDinero',function(precio)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(precio)
	xPlayer.showNotification("~g~¡Has ganado ~b~" .. math.floor(precio) .. "€~g~ por este trayecto!")
end)

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('pk_bus:getJob')
AddEventHandler('pk_bus:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('pk_bus:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('reg_extraitems:bulletproof', source)
	if Config.Removeables.BulletProofVest then
		xPlayer.removeInventoryItem('bulletproof', 1)
	end
	xPlayer.showNotification(_U('used_bulletproof'))
end)
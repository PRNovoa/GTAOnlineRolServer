ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('drugsmafias:buydrug')
AddEventHandler('drugsmafias:buydrug', function(drugmafia, item, totalprice, count)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(item, count) then
        if xPlayer.getMoney() >= totalprice then
            xPlayer.removeMoney(totalprice)
            xPlayer.addInventoryItem(item, count)
            xPlayer.showNotification("~g~¡Compra completada!")
        else
            xPlayer.showNotification("~r~¡No tienes suficiente dinero!")
        end
    else
        xPlayer.showNotification("~r~¡No tienes espacio suficiente en tu inventario!")
    end
end)
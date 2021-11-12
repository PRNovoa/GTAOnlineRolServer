ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('pk_jardinero:wezdmuchawe') 
AddEventHandler('pk_jardinero:wezdmuchawe', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ilosc = xPlayer.getInventoryItem('soplador').count
        if ilosc > 0 then
            TriggerClientEvent('esx:showNotification', _source, '~r~¡Ya tienes uno!')
        else
            xPlayer.addInventoryItem('soplador', 1)
            TriggerClientEvent('esx:showNotification', _source, '~g~¡Devuélvelo cuando acabes!')
        end
end)

RegisterServerEvent('pk_jardinero:odlozdmuchawe') 
AddEventHandler('pk_jardinero:odlozdmuchawe', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ilosc = xPlayer.getInventoryItem('soplador').count
        if ilosc >= 1 then
            xPlayer.removeInventoryItem('soplador', 1)
            TriggerClientEvent('esx:showNotification', _source, '~g~¡Gracias por devolverlo!')
        else
            TriggerClientEvent('esx:showNotification', _source, '~r~No tienes ningún soplador')
        end
end)

RegisterServerEvent('pk_jardinero:pay') 
AddEventHandler('pk_jardinero:pay', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local pay = math.random(70,90)
    xPlayer.addMoney(pay)
    TriggerClientEvent('esx:showNotification', _source, '~g~¡Te hemos pagado ' .. pay .. '€!')
end)
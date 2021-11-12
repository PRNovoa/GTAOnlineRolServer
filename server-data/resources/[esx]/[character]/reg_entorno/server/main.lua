ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("entorno:showServer")
AddEventHandler("entorno:showServer", function(entorno, sourcecoords)
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    TriggerClientEvent("entorno:showClient", -1, name, entorno, sourcecoords)
end)
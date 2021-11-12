ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentifier(playerId)
    for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			return string.sub(v, 9)
		end
	end
end

RegisterNetEvent("reportar:permissionServer")
AddEventHandler("reportar:permissionServer", function()
    local src = source
    local sourceidentifier = getIdentifier(src)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @id',
    { ['@id'] = sourceidentifier},
    function(result)
        if (#result ~= 0) then
            TriggerClientEvent("reportar:permissionClient", src, result[1].group)
        end
    end)
end)

RegisterServerEvent("reportar:showServer")
AddEventHandler("reportar:showServer", function(reporte)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local name = xPlayer.getName()
    TriggerClientEvent("reportar:showClient", -1, name, src, reporte)
end)
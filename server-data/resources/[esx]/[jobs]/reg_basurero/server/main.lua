ESX = nil
passanger1 = nil
passanger2 = nil
passanger3 = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_garbagejob:pay132')
AddEventHandler('esx_garbagejob:pay132', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local payamount = math.ceil(amount)
	xPlayer.addMoney(tonumber(payamount))
	TriggerEvent('exp:addExperience',0.1*amount,source)
	TriggerClientEvent('esx:showNotification', source, '~s~Has recibido~g~ '..payamount..' ~s~por esta parada~s~!')
end)

RegisterServerEvent('esx_garbagejob:binselect')
AddEventHandler('esx_garbagejob:binselect', function(binpos, platenumber, bagnumb)
	TriggerClientEvent('esx_garbagejob:setbin', -1, binpos, platenumber,  bagnumb)
end)

RegisterServerEvent('esx_garbagejob:requestpay')
AddEventHandler('esx_garbagejob:requestpay', function(platenumber, amount)
	TriggerClientEvent('esx_garbagejob:startpayrequest', -1, platenumber, amount)
end)

RegisterServerEvent('esx_garbagejob:bagremoval')
AddEventHandler('esx_garbagejob:bagremoval', function(platenumber)
	TriggerClientEvent('esx_garbagejob:removedbag', -1, platenumber)

end)

RegisterServerEvent('esx_garbagejob:endcollection')
AddEventHandler('esx_garbagejob:endcollection', function(platenumber)
	TriggerClientEvent('esx_garbagejob:clearjob', -1, platenumber)
end)

RegisterServerEvent('esx_garbagejob:reportbags')
AddEventHandler('esx_garbagejob:reportbags', function(platenumber)
	TriggerClientEvent('esx_garbagejob:countbagtotal', -1, platenumber)
end)

RegisterServerEvent('esx_garbagejob:bagsdone')
AddEventHandler('esx_garbagejob:bagsdone', function(platenumber, bagstopay)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_garbagejob:addbags', -1, platenumber, bagstopay, xPlayer )
end)

RegisterServerEvent('esx_garbagejob:setconfig')
AddEventHandler('esx_garbagejob:setconfig', function()
	_source = source
	local currenttruckcount = Config.TruckPlateNumb
	TriggerClientEvent('esxgarbagejob:configset', _source,  currenttruckcount)
end)

RegisterServerEvent('esxgarbagejob:movetruckcount')
AddEventHandler('esxgarbagejob:movetruckcount', function()
	local currenttruckcount = Config.TruckPlateNumb + 1
	if currenttruckcount == 999 then currenttruckcount = 1 end
	Config.TruckPlateNumb = currenttruckcount
	TriggerClientEvent('esxgarbagejob:configset', -1,  Config.TruckPlateNumb)
end)

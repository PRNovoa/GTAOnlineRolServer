ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('bread', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_bread'))
end)

ESX.RegisterUsableItem('chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chocolate', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_ld_snack_01')
	xPlayer.showNotification(_U('used_chocolate'))
end)


ESX.RegisterUsableItem('cupcake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cupcake', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_cupcake'))
end)

ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	xPlayer.showNotification(_U('used_hamburger'))
end)

ESX.RegisterUsableItem('pistachio', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pistachio', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_ld_snack_01')
	xPlayer.showNotification(_U('used_pistachio'))
end)

ESX.RegisterUsableItem('chips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chips', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_ld_snack_01')
	xPlayer.showNotification(_U('used_chips'))
end)

ESX.RegisterUsableItem('cashew', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cashew', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_ld_snack_01')
	xPlayer.showNotification(_U('used_cashew'))
end)

ESX.RegisterUsableItem('pizza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pizza', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_pizza_oven_01')
	xPlayer.showNotification(_U('used_pizza'))
end)

ESX.RegisterUsableItem('sandwich', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sandwich', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01')
	xPlayer.showNotification(_U('used_sandwich'))
end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('water', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_water'))
end)

ESX.RegisterUsableItem('cocacola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cocacola', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_cocacola'))
end)

ESX.RegisterUsableItem('drpepper', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('drpepper', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_drpepper'))
end)

ESX.RegisterUsableItem('energy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('energy', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_energy'))
end)

ESX.RegisterUsableItem('icetea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('icetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_icetea'))
end)

ESX.RegisterUsableItem('lemonade', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('lemonade', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_lemonade'))
end)


ESX.RegisterUsableItem('cigarette', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cigarette', 1)

	TriggerClientEvent('esx_basicneeds:onSmoke', source,'ng_proc_cigarette01a', true)
	xPlayer.showNotification(_U('used_cigarette'))
end)

-- BEBIDAS ALCOHOLICAS

ESX.RegisterUsableItem('beer', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source,'prop_amb_beer_bottle')
	Wait(2000)
	--TriggerClientEvent('esx_basicneeds:alcoholEffect', source)
	xPlayer.showNotification(_U('used_beer'))
end)

ESX.RegisterUsableItem('tequila', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('tequila', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source,'prop_sh_shot_glass')
	Wait(2000)
	TriggerClientEvent('esx_basicneeds:alcoholEffect', source)
	xPlayer.showNotification(_U('used_tequila'))
end)

ESX.RegisterUsableItem('vodka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source,'prop_sh_shot_glass')
	Wait(2000)
	TriggerClientEvent('esx_basicneeds:alcoholEffect', source)
	xPlayer.showNotification(_U('used_vodka'))
end)

ESX.RegisterUsableItem('wine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('wine', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source,'prop_sh_wine_glass')
	Wait(2000)
	TriggerClientEvent('esx_basicneeds:alcoholEffect', source)
	xPlayer.showNotification(_U('used_wine'))
end)

ESX.RegisterUsableItem('whisky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source,'prop_sh_tall_glass')
	Wait(2000)
	TriggerClientEvent('esx_basicneeds:alcoholEffect', source)
	xPlayer.showNotification(_U('used_whisky'))
end)

-- DROGAS!!!!

ESX.RegisterUsableItem('weed', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_basicneeds:onSmoke', source,'ng_proc_cigarette01a')
	xPlayer.showNotification(_U('used_weed'))
end)

ESX.RegisterUsableItem('opium', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('opium', 1)

	TriggerClientEvent('esx_basicneeds:onSmoke', source,'ng_proc_cigarette01a')
	xPlayer.showNotification(_U('used_opium'))
end)

ESX.RegisterUsableItem('meth', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('meth', 1)

	TriggerClientEvent('esx_basicneeds:onSmoke', source,'ng_proc_cigarette01a')
	xPlayer.showNotification(_U('used_meth'))
end)

ESX.RegisterUsableItem('coke', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('coke', 1)

	TriggerClientEvent('esx_basicneeds:onSmoke', source)
	xPlayer.showNotification(_U('used_coke'))
end)

ESX.RegisterCommand('heal', 'admin', function(xPlayer, args, showError)
	args.playerId.triggerEvent('esx_basicneeds:healPlayer')
	args.playerId.triggerEvent('chat:addMessage', {args = {'^Curar', 'Has sido curado.'}})
end, true, {help = 'Cura a un jugador o a ti mismo - rellena la comida y el hambre.', validate = true, arguments = {
	{name = 'playerId', help = 'the player id', type = 'player'}
}})

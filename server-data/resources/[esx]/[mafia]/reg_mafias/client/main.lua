-- Cosas de ESX
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job2 == nil do
        Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.UI.Menu.CloseAll()
    ESX.PlayerData.job2 = job2
end)

Citizen.CreateThread(function()
    Wait(2000)
    while true do
        if ESX.PlayerData.job2 and string.find(ESX.PlayerData.job2.name, "mafia") and IsControlJustReleased(1, 56) then
            OpenInteractionMenu()
        end
        Wait(0)
    end
end)

function OpenInteractionMenu()
	ESX.UI.Menu.CloseAll()
    local elements = {
        {label = _U('search'), value = 'search'},
		{label = _U('handcuff'), value = 'handcuff'},
		{label = _U('uncuff'), value = 'uncuff'},
        {label = _U('drag'), value = 'drag'},
        {label = _U('put_in_vehicle'), value = 'put_in_vehicle'},
        {label = _U('out_the_vehicle'), value = 'out_the_vehicle'}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
        title    = _U('citizen_interaction'),
        align    = 'top-left',
        elements = elements
    }, function(data2, menu2)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then
            local action = data2.current.value
            if action == 'search' then
                OpenBodySearchMenu(closestPlayer)
			elseif action == 'handcuff' then
				local target, distance = ESX.Game.GetClosestPlayer()
				playerheading = GetEntityHeading(GetPlayerPed(-1))
				playerlocation = GetEntityForwardVector(PlayerPedId())
				playerCoords = GetEntityCoords(GetPlayerPed(-1))
				local target_id = GetPlayerServerId(target)
				if distance <= 2.0 then
					TriggerServerEvent('esx_policejob:requestarrest', target_id, playerheading, playerCoords, playerlocation)
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			elseif action == 'uncuff' then
				local target, distance = ESX.Game.GetClosestPlayer()
				playerheading = GetEntityHeading(GetPlayerPed(-1))
				playerlocation = GetEntityForwardVector(PlayerPedId())
				playerCoords = GetEntityCoords(GetPlayerPed(-1))
				local target_id = GetPlayerServerId(target)
				if distance <= 2.0 then
					TriggerServerEvent('esx_policejob:requestrelease', target_id, playerheading, playerCoords, playerlocation)
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end	
            elseif action == 'drag' then
                TriggerServerEvent('mafias:drag', GetPlayerServerId(closestPlayer))
            elseif action == 'put_in_vehicle' then
                TriggerServerEvent('mafias:putInVehicle', GetPlayerServerId(closestPlayer))
            elseif action == 'out_the_vehicle' then
                TriggerServerEvent('mafias:OutVehicle', GetPlayerServerId(closestPlayer))
            end
        else
            ESX.ShowNotification(_U('no_players_nearby'))
        end
    end, function(data2, menu2)
        menu2.close()
    end)
end

function OpenBodySearchMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {}

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = _U('search'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				OpenBodySearchMenu(player)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end
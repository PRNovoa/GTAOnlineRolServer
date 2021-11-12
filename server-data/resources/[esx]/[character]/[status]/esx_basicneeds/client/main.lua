ESX          = nil
local IsDead = false
local IsAnimated = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F', function(status)
		return false
	end, function(status)
		status.remove(500)
	end)
	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1', function(status)
		return false
	end, function(status)
		status.remove(325)
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)

			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 3
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 150 then
						health = health - 3
					else
						health = health - 1
					end
				end
			end)

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

local alcohol = 0
local drugs = 0

Citizen.CreateThread(function()
	while true do
		Wait(120000)
		if alcohol > 0 then
			alcohol = alcohol - 1
		end
		if drugs > 0 then
			drugs = drugs - 1
		end
	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:alcoholEffect')
AddEventHandler('esx_basicneeds:alcoholEffect', function()
	Citizen.CreateThread(function()
		RequestAnimSet("move_m@drunk@verydrunk")
		while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
			Citizen.Wait(0)
		end

		if alcohol ~= 0 then
			--TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRUG_DEALER", 0, 1)
			DoScreenFadeOut(1000 * alcohol * alcohol)
			Citizen.Wait(1000)
			ClearPedTasksImmediately(GetPlayerPed(-1))
			SetTimecycleModifier("spectator5")
			SetPedMotionBlur(GetPlayerPed(-1), true)
			SetPedMovementClipset(GetPlayerPed(-1), "move_m@drunk@verydrunk", true)
			SetPedIsDrunk(GetPlayerPed(-1), true)
			DoScreenFadeIn(1000 * alcohol * alcohol)
			Citizen.Wait(2000 * alcohol * alcohol)
			ClearPedTasks(GetPlayerPed(-1) * alcohol)
			DoScreenFadeOut(1000 * alcohol * alcohol)
			Citizen.Wait(1000 * alcohol)
			DoScreenFadeIn(1000 * alcohol * alcohol)
			ClearTimecycleModifier()
			ResetScenarioTypesEnabled()
			ResetPedMovementClipset(GetPlayerPed(-1), 0)
			SetPedIsDrunk(GetPlayerPed(-1), false)
			SetPedMotionBlur(GetPlayerPed(-1), false)
		end
		alcohol = alcohol + 1

	end)
end)


RegisterNetEvent('esx_basicneeds:onSmoke')
AddEventHandler('esx_basicneeds:onSmoke', function(prop_name, noeffect)
	if not IsAnimated then
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			if prop_name == 'ng_proc_cigarette01a' then
				local x,y,z = table.unpack(GetEntityCoords(playerPed))
				local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
				local boneIndex = GetPedBoneIndex(playerPed, 18905)
				AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
				
				ESX.Streaming.RequestAnimDict('amb@world_human_aa_smoke@male@idle_a', function()
					TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_SMOKING', 0, false)
		
					Citizen.Wait(10000)
					IsAnimated = false
					ClearPedSecondaryTask(playerPed)
					ClearPedTasksImmediately(playerPed)
					DeleteObject(prop)
				end)
			else
				ESX.Streaming.RequestAnimDict('anim@amb@nightclub@peds@', function()
					TaskPlayAnim(playerPed, 'anim@amb@nightclub@peds@', 'missfbi3_party_snort_coke_b_male3', 8.0, 8.0, -1, 0, 0.0)
					
					Citizen.Wait(3000)
					IsAnimated = false
					ClearPedSecondaryTask(playerPed)
				end)
			end

			if not noeffect then
				drugs = drugs + 1
				Citizen.Wait(5000)
				DoScreenFadeOut(1000*drugs)
				Citizen.Wait(1000*drugs)
				ClearPedTasksImmediately(GetPlayerPed(-1))
				SetTimecycleModifier("spectator5")
				SetPedMotionBlur(GetPlayerPed(-1), true)
				SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
				SetPedIsDrunk(GetPlayerPed(-1), true)
				DoScreenFadeIn(1000*drugs)
				Citizen.Wait(3000*drugs)
				ClearPedTasks(GetPlayerPed(-1))
				Citizen.Wait(30000*drugs)
				DoScreenFadeOut(1000*drugs)
				Citizen.Wait(1000*drugs)
				DoScreenFadeIn(1000*drugs)
				ClearTimecycleModifier()
				ResetScenarioTypesEnabled()
				ResetPedMovementClipset(GetPlayerPed(-1), 0)
				SetPedIsDrunk(GetPlayerPed(-1), false)
				SetPedMotionBlur(GetPlayerPed(-1), false)
			end
		end)

	end
end)
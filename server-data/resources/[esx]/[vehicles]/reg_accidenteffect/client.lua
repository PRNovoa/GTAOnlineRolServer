isBlackedOut = false
injuredTime = 0

oldBodyHealth = 0

function effect(intensity)
	isBlackedOut = true
	SendNUIMessage({
		transaction = 'play'
	})

	Citizen.CreateThread(function()
		DoScreenFadeOut(10*intensity)
		StartScreenEffect('DeathFailOut', 0, true)
		SetTimecycleModifier("hud_def_blur")
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
		Citizen.Wait(100*intensity)
		ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1*intensity)
		DoScreenFadeIn(100*intensity)
		Citizen.Wait(100*intensity)

		DoScreenFadeOut(10*intensity)
		Citizen.Wait(75*intensity)
		ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1*intensity)
		DoScreenFadeIn(75*intensity)
		Citizen.Wait(75*intensity)

		DoScreenFadeOut(10*intensity)
		Citizen.Wait(50*intensity)
		ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1*intensity)
		DoScreenFadeIn(50*intensity)
		Citizen.Wait(50*intensity)

		DoScreenFadeOut(10*intensity)
		Citizen.Wait(25*intensity)
		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(25*intensity)

		injuredTime = math.min(20, math.floor((10*intensity) / 20 + 0.5))
		isBlackedOut = false
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)

		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if DoesEntityExist(vehicle) then
			if not GetPlayerInvincible(PlayerId()) then
				local vehicleClass = GetVehicleClass(vehicle)
				if (vehicleClass >= 0 and vehicleClass <= 12) or vehicleClass == 17 or vehicleClass == 18 or vehicleClass == 20 then
					local currentHealth = GetVehicleBodyHealth(vehicle)
					if oldBodyHealth == 0 then
						oldBodyHealth = currentHealth
					end
					if currentHealth ~= oldBodyHealth then
						local damage = oldBodyHealth - currentHealth
						if not isBlackedOut and damage >= 20 then
							effect(math.floor(damage / 10))
						end

						oldBodyHealth = currentHealth
					end
				end
			end
		else
			oldBodyHealth = 0
		end

		if injuredTime > 0 then
			SetPedMovementClipset(playerPed, "move_m@injured", 1.0)
			ShakeGameplayCam("DRUNK_SHAKE", 3.0)

			repeat
				DisableControlAction(0,71,true) -- veh forward
				DisableControlAction(0,72,true) -- veh backwards
				DisableControlAction(0,63,true) -- veh turn left
				DisableControlAction(0,64,true) -- veh turn right
				DisableControlAction(0,75,true) -- disable exit vehicle
				injuredTime = injuredTime - 1
				if math.random(1, 100) < 50 then
					Citizen.CreateThread(function()
						ClearTimecycleModifier()
						SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
						Citizen.Wait((20 - injuredTime) * 50)
						SetTimecycleModifier("hud_def_blur")
					end)
				end

				SetPedToRagdoll(playerPed, 200, 200, 3, true, false, false)
				Citizen.Wait(1400)
			until injuredTime == 0

			ClearTimecycleModifier()
			SendNUIMessage({
				transaction = 'fade',
				time = 3000
			})

			StopGameplayCamShaking(true)
			ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
			ResetPedMovementClipset(playerPed, 0.0)
		end
	end
end)
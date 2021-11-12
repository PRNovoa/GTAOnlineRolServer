local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

ESX                           = nil
local PlayerData                = {}
local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local hasAlreadyEnteredMarkerr 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false
local isInJoblistingMarkerr 		 = false
local przeb = false
local OnJob                     = false
local Done 						= false
local Blips                     = {}
local dmuch = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(5000)
end)

local blips = {
	{title="Jardinero", colour=2, id=409, x = -1351.43, y = 134.17, z = 57.26}
}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
	  info.blip = AddBlipForCoord(info.x, info.y, info.z)
	  SetBlipSprite(info.blip, info.id)
	  SetBlipDisplay(info.blip, 4)
	  SetBlipScale(info.blip, 1.0)
	  SetBlipColour(info.blip, info.colour)
	  SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(info.title)
	  EndTextCommandSetBlipName(info.blip)
	end
 end)

Citizen.CreateThread(function() -- Funckja od postaw przebierz, item, auto
	while true do
		Wait(5)
		 		local coords  = GetEntityCoords(PlayerPedId())
					 if(GetDistanceBetweenCoords(coords, -1351.47, 134.4, 57.26, true) < 40.0) then
						if PlayerData.job ~= nil and PlayerData.job.name == 'jardinero' then
							DrawText3Ds(-1359.82, 125.59, 57.42, '~b~[E] ~w~Coger un soplador')	
							DrawText3Ds(-1360.46, 132.28, 57.43, '~b~[E] ~w~Dejar el soplador')	
							DrawText3Ds(-1348.64, 142.74, 57.44, '~b~[E] ~w~Guardarropa')	
							DrawText3Ds(-1352.58, 125.31, 57.24, '~b~[E] ~w~Coger vehículo')	
							DrawText3Ds(-1344.39, 131.83, 57.24, '~b~[E] ~w~Dejar vehículo')	
							local coords  = GetEntityCoords(PlayerPedId())
							local isInMarker  = false
							local currentZone = nil

										if(GetDistanceBetweenCoords(coords, -1359.82,125.59, 57.42, true) < 5.0) then
												if IsControlJustReleased(0, Keys['E']) then
													if przeb == true then
														TriggerServerEvent('pk_jardinero:wezdmuchawe')
														torba1()
														dmuch = true
													else
														ESX.ShowNotification('~r~¡Tienes que estar de servicio!')
												end
											end
										end
		
										if(GetDistanceBetweenCoords(coords, -1360.46,132.28, 57.43, true) < 5.0) then
											if IsControlJustReleased(0, Keys['E']) then
												if przeb == true then
													TriggerServerEvent('pk_jardinero:odlozdmuchawe')
													torba2()
													dmuch = false
												else
													ESX.ShowNotification('~r~¡Tienes que estar de servicio!')
												end
											end
										end
								
										if(GetDistanceBetweenCoords(coords, -1348.64,142.74, 57.44, true) < 5.0) then
											if IsControlJustReleased(0, Keys['E']) then
												przebierz()
											end
										end
						
										if(GetDistanceBetweenCoords(coords, -1352.58,125.31, 57.24, true) < 5.0) then
							
											if IsControlJustReleased(0, Keys['E']) then
												if przeb == true then
													if dmuch == true then
													local veh = "Mower"
													local x,y,z = GetEntityCoords(PlayerPedId())
													vehiclehash = GetHashKey(veh)
													RequestModel(vehiclehash)
													local spawned = CreateVehicle(vehiclehash, -1351.61, 133.97, 56.26, GetEntityHeading(PlayerPedId())+90, 1, 0)
													SetVehicleFuelLevel(spawned, 100.0)
													DecorSetFloat(spawned, "_FUEL_LEVEL", GetVehicleFuelLevel(spawned))
													SetPedIntoVehicle(PlayerPedId(), spawned, -1)
													ESX.ShowNotification('~g~Has cogido un vehiculo del garaje')
													StartNPCJob()
													elseif dmuch == false then
														ESX.ShowNotification('~r~Te falta el soplador')
												else
													ESX.ShowNotification('~r~¡Debes cambiar!')
												end
											end
											end

										end
		
										if(GetDistanceBetweenCoords(coords, -1344.39,131.83, 57.24, true) < 5.0) then
											if IsControlJustReleased(0, Keys['E']) then
												if IsPedInAnyVehicle(PlayerPedId(),  false) then
													local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
													local hash      = GetEntityModel(vehicle)
													if DoesEntityExist(vehicle) then
														if hash == GetHashKey('Mower') then
																ESX.ShowNotification('~g~El vehiculo se ha devuelto')
																DeleteVehicle(vehicle)
											                    StopNPCJob(true)
				                                                RemoveBlip(Blips['NPCTargetP'])
														else
															ESX.ShowNotification('~r~Vehículo incorrecto')
														end											
													end
												end
											end
										end
					end
			end
	end

end)

function przebierz()
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.torso_1 == 66 and skin.torso_2 == 2 and skin.tshirt_1 == 15 then
		 	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		 		TriggerEvent('skinchanger:loadSkin', skin)
			 end)
			przeb = false
			ESX.ShowNotification('~r~¡Has salido de servicio!')
		else
			local clothesSkin = {
				['tshirt_1'] = 15, ['tshirt_2'] = 0,
				['torso_1'] = 66, ['torso_2'] = 2,
				['arms'] = 37, ['arms_2'] = 0,
				['pants_1'] = 39, ['pants_2'] = 2,
				['chain_1'] = 0,
				['shoes_1'] = 35, ['shoes_2'] = 0
				}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
			przeb = true
			ESX.ShowNotification('~g~¡Entras en servicio!')
		end
	end)
end

function torba1()
	TriggerEvent('skinchanger:getSkin', function(skin)
			local clothesSkin = {
				['bags_1'] = 40, ['bags_2'] = 0
				}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
	end)
end

function torba2()
	TriggerEvent('skinchanger:getSkin', function(skin)
			local clothesSkin = {
				['bags_1'] = 0, ['bags_2'] = 0
				}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
	end)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.40, 0.40)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

-- -- Misje


function SelectP()
	local index = GetRandomIntInRange(1,  #Config.P)

	for k,v in pairs(Config.Zones) do
		if v.Pos.x == Config.P[index].x and v.Pos.y == Config.P[index].y and v.Pos.z == Config.P[index].z then
			return k
		end
	end
end

-- git
function StartNPCJob()
	NPCTargetP     = SelectP()
	local zone            = Config.Zones[NPCTargetP]
	ESX.ShowNotification('Dirígete a la siguiente localización')
	Blips['NPCTargetP'] = AddBlipForCoord(zone.Pos.x,  zone.Pos.y,  zone.Pos.z)
	SetBlipRoute(Blips['NPCTargetP'], true)
	Done = true
end

--git
function StopNPCJob(cancel)

	if Blips['NPCTargetP'] ~= nil then
		RemoveBlip(Blips['NPCTargetP'])
		Blips['NPCTargetP'] = nil
	end

	OnJob = false

	if cancel then
		ESX.ShowNotification('~r~Has cancelado las misiones')
	else
		TriggerServerEvent('pk_jardinero:pay')
		StartNPCJob()
		Done = true
	end
end

-- git
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NPCTargetP ~= nil then

			local coords = GetEntityCoords(GetPlayerPed(-1))
			local zone   = Config.Zones[NPCTargetP]
			local playerPed = GetPlayerPed(-1)

			if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < 3 then

				HelpPromt('Pulsa ~INPUT_CONTEXT~ para trabajar')
				if IsControlJustReleased(1, Keys["E"]) and PlayerData.job ~= nil then
					TaskStartScenarioInPlace(playerPed, "world_human_gardener_leaf_blower", -1, true)
					Wait(5000)
					StopNPCJob()
					Wait(500)
					ClearPedTasksImmediately(playerPed)
					Done = false
				end
			end
		end
	end
end)

function HelpPromt(text)
	Citizen.CreateThread(function()
		SetTextComponentFormat("STRING")
		AddTextComponentString(text)
		DisplayHelpTextFromStringLabel(0, state, 0, -1)

	end)
end

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end
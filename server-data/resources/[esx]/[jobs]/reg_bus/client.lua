ESX = nil

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

local isInJob = false
local estacion = {x = 434.12, y = -646.55, z = 27.73}
local spawnu = {x = 420.79, y = -642.07, z = 28.5}
local isInRoute = true
local multiplicador_de_dinero = 0.15
local isTheFirstRoute = false
local plateab = "AUTOBUS"
local blip = nil

ax = 20
ay = 20
az = 20
--------------------------------------------
--------------------------------------------
--------------------------------------------

local paradas = {
	[1] = {x = 234.63, y = -857.26, z = 28.75 },
	[2] = {x = 244.56, y = -860.74, z = 28.51 },
	[3] = {x = 113.9, y = -784.94, z = 30.36 },
	[4] = {x = 256.89, y = -1123.96, z = 28.21 },
	[5] = {x = 260.5, y = -1186.7, z = 28.51 },
	[6] = {x = -171.89, y = -820.25, z = 30.11 },
	[7] = {x = -244.22, y = -714.93, z = 32.44 },
	[8] = {x = -504.7, y = -667.16, z = 32.03 },
	[9] = {x = -691.62, y = -667.34, z = 29.83 },
	[10] = {x = -936.19, y = -321.18, z = 37.93 },
	[11] = {x = -1211.3, y = -1218.8, z = 6.64 },
	[12] = {x = -286.37, y = -1006.66, z = 29.38 },
	[13] = {x = -558.27, y = -845.11, z = 26.54 }
}

local blips = {
	{title="Estacion de autobus", colour=3, id=225, x = 434.12, y = -646.55, z = 27.73},
	--{id=430,x=75.5,y=20.21,z=68.16}	
}
local job = nil
AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent('pk_bus:getJob')
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  	TriggerServerEvent('pk_bus:getJob')
end)
TriggerServerEvent('pk_bus:getJob')
RegisterNetEvent('pk_bus:setJob')
AddEventHandler('pk_bus:setJob',function(jobu)
	job = jobu
end)
--CICLO PARA PONER LOS SIGNOS

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function SetUniform(playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.male)
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.female)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isInJob == false then
			DrawMarker(1,estacion.x,estacion.y,estacion.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,51,255, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(estacion.x, estacion.y, estacion.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
				drawTxt("PULSA E PARA COMENZAR A TRABAJAR DE CONDUCTOR DE AUTOBUS",2, true, 0.5, 0.95, 0.50,255,51,255,255)
				if IsControlJustPressed(1,38) and job == "bus" then
					SetUniform(PlayerPedId())
					paradasiguiente = math.random(1, 13)
					isInJob = true
					spawn_taxi()
				    primer_objetivo(paradas,paradasiguiente)
				    isTheFirstRoute = true
				elseif IsControlJustPressed(1,38) and not(job == "bus") then 
					TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0},"No eres conductor de autobus.")
				end
			end
		end
		--if ( IsPedSittingInAnyVehicle( ped ) ) then 
        --    local vehicle = GetVehiclePedIsIn( ped, false )
        --end
		if isInJob == true and isInRoute == true and isTheFirstRoute == true then
			drawTxt("DIRIGETE AL PUNTO MARCADO EN EL MAPA",2, true, 0.5, 0.83, 0.50,255,255,255,255)
		end
		if isInJob == true and isInRoute == true and isTheFirstRoute == false then
			drawTxt("DIRIGETE A LA SIGUIENTE PARADA",2, true, 0.5, 0.83, 0.50,255,255,255,255)
		end
		if isInJob == true then
			DrawMarker(1,ax,ay,az - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,255,102, 200, 0, 0, 0, 0)
		end
		if isInJob == true then
			DrawMarker(1,431.19,-610.08,27.5, 0, 0, 0, 0, 0, 0, 5.5001, 5.5001, 0.4001,255,51,255, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(431.19,-610.08,27.5, GetEntityCoords(GetPlayerPed(-1),true)) < 11 then
						drawTxt("PULSA E PARA DEJAR DE TRABAJAR",2, true, 0.5, 0.95, 0.50,255,51,255,255)
						if IsControlJustPressed(1,38) then
							if ( IsPedSittingInAnyVehicle( GetPlayerPed(-1) ) ) then
								RemoveBlip(blip)
								local vehicleu = GetVehiclePedIsIn(GetPlayerPed(-1), false)
								local plateb = GetVehicleNumberPlateText(vehicleu)
								--TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, plateb)
								--TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, plateab)
									--if not plateb == plateab then
								SetEntityAsMissionEntity( vehicleu, true, true )
								deleteCar( vehicleu )
									--end
							end
							ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
								local model = nil
					
								if skin.sex == 0 then
									model = GetHashKey("mp_m_freemode_01")
								else
									model = GetHashKey("mp_f_freemode_01")
								end
					
								RequestModel(model)
								while not HasModelLoaded(model) do
									RequestModel(model)
									Citizen.Wait(1)
								end
					
								SetPlayerModel(PlayerId(), model)
								SetModelAsNoLongerNeeded(model)
					
								TriggerEvent('skinchanger:loadSkin', skin)
								TriggerEvent('esx:restoreLoadout')
							end)
							isInJob = false
							isInRoute = true
							isTheFirstRoute = false
						end
			end
		end
			if GetDistanceBetweenCoords(ax,ay,az, GetEntityCoords(GetPlayerPed(-1),true)) < 5 then
				isInRoute = false
				drawTxt("PULSA E PARA COBRAR A LOS PASAJEROS",2, true, 0.5, 0.83, 0.50,255,255,102,255)
				if IsControlJustPressed(1,38) then 
					if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("coach"))  then
						local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
						local plateu = GetVehicleNumberPlateText(vehicle)
						TriggerServerEvent("pk_bus:cobrarDinero", precio)
						isTheFirstRoute = false
						ax = 0
						ay = 0
						az = 0
						paradasiguiente = math.random(1, 13)
						siguiente_objetivo(paradas,paradasiguiente)
					else
						TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0},"¿Como cojones quieres coger los pasajeros con este vehículo?")
					end
				end
			end
	end
end)

----------------------------------------------
----------------------------------------------
----------------------------------------------

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function spawn_taxi()
	Citizen.Wait(0)

	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('coach')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local spawned_car = CreateVehicle(vehicle, spawnu.x,spawnu.y,spawnu.z, 431.436, - 996.786, 25.1887, true, false)

	local plate = "CTZN"..math.random(100, 900)
	SetVehicleFuelLevel(spawned_car, 100.0)
	DecorSetFloat(spawned_car, "_FUEL_LEVEL", GetVehicleFuelLevel(spawned_car))
	SetVehicleNumberPlateText(spawned_car, plate)
	SetVehicleOnGroundProperly(spawned_car)
	--SetVehicleLivery(spawned_car, 2)
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	SetEntityHeading(myPed, 180.0)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end

function primer_objetivo(paradas,paradasiguiente)
	blip = AddBlipForCoord(paradas[paradasiguiente].x,paradas[paradasiguiente].y,paradas[paradasiguiente].z)
	SetBlipRoute(blip, true)
	ax = paradas[paradasiguiente].x
	ay = paradas[paradasiguiente].y
	az = paradas[paradasiguiente].z
	isInRoute = true
	distancia = GetDistanceBetweenCoords(estacion.x, estacion.y, estacion.z, ax,ay,az)
	precio = distancia * multiplicador_de_dinero
	precio = round(precio)
end

function siguiente_objetivo(paradas,paradasiguiente)
	RemoveBlip(blip)
	blip = AddBlipForCoord(paradas[paradasiguiente].x,paradas[paradasiguiente].y,paradas[paradasiguiente].z)
	SetBlipRoute(blip, true)
	distancia = GetDistanceBetweenCoords(paradas[paradasiguiente].x, paradas[paradasiguiente].y, paradas[paradasiguiente].z, ax,ay,az)
	ax = paradas[paradasiguiente].x
	ay = paradas[paradasiguiente].y
	az = paradas[paradasiguiente].z
	isInRoute = true
	precio = distancia * multiplicador_de_dinero
	precio = round(precio)

end

function round(num, numDecimalPlaces)
	local mult = 5^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

--restart pk_bus
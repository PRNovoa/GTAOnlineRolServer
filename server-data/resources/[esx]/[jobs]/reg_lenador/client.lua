--en la zona de minas: x maderas con un máximo extraíble. Se regenera con el tiempo, si llega a 0 no puedes leñar.
local clicks = 0
local madera = nil
local npcvender = true --false si no quieres el npc que te lo cambia por dinero

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('leñar:recibodatacliente')
AddEventHandler('leñar:recibodatacliente',function(data)
    maderas = data
end)

local job = nil
AddEventHandler('playerSpawned', function(spawn)
  TriggerServerEvent('leñar:getJob')
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    TriggerServerEvent('leñar:getJob')
end)
TriggerServerEvent('leñar:getJob')
RegisterNetEvent('leñar:setJob')
AddEventHandler('leñar:setJob',function(jobu)
  job = jobu
end)

function DrawText3D(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DrawText3Dlittle(x,y,z, text) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.5*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

 function get3DDistance(x1, y1, z1, x2, y2, z2)
    local a = (x1 - x2) * (x1 - x2)
    local b = (y1 - y2) * (y1 - y2)
    local c = (z1 - z2) * (z1 - z2)
    return math.sqrt(a + b + c)
end

--[[Citizen.CreateThread(function()
    local  wanted_model= "A_M_O_Tramp_01"
     modelHash = GetHashKey(wanted_model)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
    createNPC() 
end)

function createNPC()
    --PRIMER NPC
	local created_ped = CreatePed(5, modelHash ,-552.49,5327.32,73.6,164.2, true, true)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_SMOKING", 0, true)
end
]]

function AbrirMenu()

	local elements = {
		{label = "Sí",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'get_job',
		{
			title  = '¿Quieres que me quede con tu madera y te de dinero a cambio?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				TriggerServerEvent('leñar:quitomin')
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

local coords

Citizen.CreateThread(function()
    while true do
		coords = GetEntityCoords(GetPlayerPed(-1))
        Citizen.Wait(0)
        for i=1, #maderas, 1 do
            if GetDistanceBetweenCoords(coords.x,coords.y,coords.z,maderas[i].x,maderas[i].y,maderas[i].z) < 75 then
                if maderas[i].vida >= 50 then
    		      DrawText3D(maderas[i].x,maderas[i].y,maderas[i].z, "Madera ~b~"..maderas[i].tipo.."~w~ : ~g~"..maderas[i].vida.."/"..maderas[i].max)
                elseif maderas[i].vida >= 25 then
                   DrawText3D(maderas[i].x,maderas[i].y,maderas[i].z, "Madera ~b~"..maderas[i].tipo.."~w~ : ~b~"..maderas[i].vida.."/"..maderas[i].max)
                elseif maderas[i].vida < 25 and maderas[i].vida ~= 0 then
                     DrawText3D(maderas[i].x,maderas[i].y,maderas[i].z, "Madera ~b~"..maderas[i].tipo.."~w~ : ~y~"..maderas[i].vida.."/"..maderas[i].max)
                elseif maderas[i].vida <= 0 then
                     DrawText3D(maderas[i].x,maderas[i].y,maderas[i].z, "Madera ~b~"..maderas[i].tipo.."~w~ : ~r~ "..maderas[i].vida.."/"..maderas[i].max)  
                end
            end
		end
    end
end)


Citizen.CreateThread(function()
	while true do
        if IsPedDead then
            clicks = 0
            madera = nil
        end
		Citizen.Wait(0)

        if GetCurrentPedWeapon(GetPlayerPed(-1),"WEAPON_BATTLEAXE",true) then
            if IsControlJustReleased(1,  24) then --click izq

                for i=1, #maderas, 1 do
                    if GetDistanceBetweenCoords(coords.x,coords.y,coords.z,maderas[i].x,maderas[i].y,maderas[i].z) < 1.8 and maderas[i].vida > 0 then
                        madera = i
                    end
                end
                if madera ~= nil then
                    if job == "leñador" then
                        click()
                        Citizen.Wait(2)
                    else
                    	DisplayHelpText("Debes ser leñador. Vuelve cuando lo seas para trabajar")
                    end
                end
            end
        end

        if get3DDistance(354.99,6524.37,28.4-1,coords.x,coords.y,coords.z) > 100 then
            local weapon = GetSelectedPedWeapon(GetPlayerPed(-1), true)
            if weapon == GetHashKey("WEAPON_BATTLEAXE") then
            	if job == "leñador" then
	                RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BATTLEAXE"))
	                ESX.ShowNotification('Te has alejado de la zona de trabajo, el hacha se ha eliminado')
	            end
            end
        end

        if get3DDistance(345.94,6496.72,28.92-1,coords.x,coords.y,coords.z) < 100 then
            DrawMarker(1,345.94,6496.72,28.92-1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.5001, 1555, 132, 23,255, 0, 0, 0,0)
        end
        if get3DDistance(345.94,6496.72,28.92-1,coords.x,coords.y,coords.z) < 1.5 then
            if job == "leñador" then
                DisplayHelpText("Presiona ~INPUT_CONTEXT~ para coger tu herramienta de trabajo")
                if IsControlJustReleased(1,38) then
                    GiveWeaponToPed(GetPlayerPed(-1),"WEAPON_BATTLEAXE",1,false,true)
                end
            else
                DisplayHelpText("Debes ser leñador. Vuelve cuando lo seas para trabajar")
            end
        end

        if npcvender then
        	if get3DDistance(-552.38,5327.27,73.6,coords.x,coords.y,coords.z) < 20 then
        		DrawText3Dlittle(-552.38,5327.27,74.6, "Parece que hombre quiere madera... -E- para interactuar")
        		if IsControlJustReleased(1,38) then
        			AbrirMenu()
        		end
        	end
    	end
	end
end)

function click()
-- Los clicks habrán que equilibrarlos a la dinámica del servidor
    if madera ~= nil then
        if maderas[madera].vida > 0 then
           if clicks >= 25 then 
                clicks = 0
                maderas[madera].vida = maderas[madera].vida - 1
                TriggerServerEvent('leñar:doymadera',maderas[madera].data)
                TriggerServerEvent('leñar:recibodata',maderas)
                madera = nil
            else
                clicks = clicks + 1 
                madera = nil
            end
        end
    end

end

local blips = {
    {title="Leñador", colour=17, id=85, x = 345.94, y = 6496.72, z = 28.92-1},
    {title="Venta de maderas", colour=17, id=85, x = -552.38,y = 5327.27,z = 73.6},
}
 
Citizen.CreateThread(function()
    Citizen.Wait(0)
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
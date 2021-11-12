--en la zona de minas: x rocas con un máximo extraíble. Se regenera con el tiempo, si llega a 0 no puedes caos_mineria.
local clicks = 0
local roca = nil
local npcvender = true --false si no quieres el npc que te lo cambia por dinero
local level = 3

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('pop_university:setMineLevel')
AddEventHandler('pop_university:setMineLevel',function(totalLevel)
    level = totalLevel
end)

RegisterNetEvent('caos_mineria:recibodatacliente')
AddEventHandler('caos_mineria:recibodatacliente',function(data)
    rocas = data
end)

local job = nil
AddEventHandler('playerSpawned', function(spawn)
  TriggerServerEvent('caos_mineria:getJob')
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    TriggerServerEvent('caos_mineria:getJob')
end)
TriggerServerEvent('caos_mineria:getJob')
RegisterNetEvent('caos_mineria:setJob')
AddEventHandler('caos_mineria:setJob',function(jobu)
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
	local created_ped = CreatePed(5, modelHash ,1905.96,3718.96,31.76,40.1, true, true)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_SMOKING", 0, true)
end]]

function AbrirMenu()

	local elements = {
		{label = "Sí",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'get_job',
		{
			title  = '¿Quieres que me quede con tus minerales y te de dinero a cambio?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'yes' then
				TriggerServerEvent('caos_mineria:quitomin')
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
        for i=1, #rocas, 1 do
            if GetDistanceBetweenCoords(coords.x,coords.y,coords.z,rocas[i].x,rocas[i].y,rocas[i].z) < 75 then
                if rocas[i].vida >= 50 then
    		      DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~g~"..rocas[i].vida.."/"..rocas[i].max)
                elseif rocas[i].vida >= 25 then
                   DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~b~"..rocas[i].vida.."/"..rocas[i].max)
                elseif rocas[i].vida < 25 and rocas[i].vida ~= 0 then
                     DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~y~"..rocas[i].vida.."/"..rocas[i].max)
                elseif rocas[i].vida <= 0 then
                     DrawText3D(rocas[i].x,rocas[i].y,rocas[i].z, "Roca de ~b~"..rocas[i].tipo.."~w~ : ~r~ "..rocas[i].vida.."/"..rocas[i].max)  
                end
            end
        end
        Wait(0)
    end
end)
Citizen.CreateThread(function()
	while true do
        if IsPedDead then
            clicks = 0
            roca = nil
        end
		Citizen.Wait(0)
        if GetCurrentPedWeapon(GetPlayerPed(-1),"WEAPON_BATTLEAXE",true) then
            if IsControlJustReleased(1,  24) then --click izq

                for i=1, #rocas, 1 do
                    if GetDistanceBetweenCoords(coords.x,coords.y,coords.z,rocas[i].x,rocas[i].y,rocas[i].z) < 1.8 and rocas[i].vida > 0 then
                        roca = i
                    end
                end
                if roca ~= nil then
                    if job == "miner" then
                        click()
                        Citizen.Wait(2500)
                    else
                    	DisplayHelpText("Debes ser minero. Vuelve cuando lo seas para trabajar")
                    end
                end
            end
        end

        if get3DDistance(coords.x,coords.y,coords.z,2953.68,2790.68,41.28) > 150 then
            local nothing, weapon = GetCurrentPedWeapon(GetPlayerPed(-1), true)
            if weapon == "WEAPON_BATTLEAXE" then
            	if job == "miner" then
	                RemoveWeaponFromPed(GetPlayerPed(-1),"WEAPON_BATTLEAXE")
	                SetNotificationTextEntry("STRING")
	                AddTextComponentString("Se te ha quitado la hacha, parece que ya no quieres trabajar más")
	                DrawNotification(false, true)
	            end
            end
        end

        if get3DDistance(2952.0,2748.8,43.48-1,coords.x,coords.y,coords.z) < 100 then
            DrawMarker(1,2952.0,2748.8,43.48-1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.5001, 1555, 132, 23,255, 0, 0, 0,0)
        end
        if get3DDistance(2952.0,2748.8,43.48-1,coords.x,coords.y,coords.z) < 1.5 then
            if job == "miner" then
                DisplayHelpText("Presiona ~INPUT_CONTEXT~ para coger tu herramienta de trabajo")
                if IsControlJustReleased(1,38) then
                    GiveWeaponToPed(GetPlayerPed(-1),"WEAPON_BATTLEAXE",1,false,true)
                end
            else
                DisplayHelpText("Debes ser minero. Vuelve cuando lo seas para trabajar")
            end
        end

        if npcvender then
        	if get3DDistance(1905.96,3718.96,31.76,coords.x,coords.y,coords.z) < 20 then
        		DrawText3Dlittle(1905.96,3718.96,33.76, "Pulsa ~y~E~s~ para vender tus minerales")
        		if IsControlJustReleased(1,38) then
        			AbrirMenu()
        		end
        	end
    	end
	end
end)

function isPossible(typed)
    if level == 0 then
        return false
    elseif level == 1 then
        if typed == "hierro" or typed == "plata" or typed == "oro" then
            return false
        end
    elseif level == 2 then
        if typed == "plata" or typed == "oro" then
            return false
        end
    elseif level == 3 then
        if typed == "oro" then
            return false
        end
    end
    return true
end

function click()
-- Los clicks habrán que equilibrarlos a la dinámica del servidor
    if roca ~= nil then
        if isPossible(rocas[roca].data) then
            
        else
            TriggerEvent('exp:NotificateError',"No puedes picar este tipo de roca.")
            return false
        end
        if rocas[roca].vida > 0 then
           if clicks >= 1 then 
                clicks = 0
                rocas[roca].vida = rocas[roca].vida - 1
                TriggerServerEvent('caos_mineria:doymineral',rocas[roca].data)
                TriggerServerEvent('caos_mineria:recibodata',rocas)
                roca = nil
            else
                clicks = clicks + 1 
                roca = nil
            end
        end
    end

end

local blips = {
    {title="Mina", colour=2, id=318, x = 2952.0, y = 2748.8, z = 43.48},
    {title="Vendedor de minerales", colour=2, id=434, x = 1905.96,y = 3718.96,z = 31.76},
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
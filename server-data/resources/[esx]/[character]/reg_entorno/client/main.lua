-- Cosas de ESX
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

TriggerEvent('chat:addSuggestion', '/entorno', 'Haz un entorno para que lo pueda ver la policía', {
})

function addBlip(coords, name)
    CreateThread(function()
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            
        SetBlipSprite (blip, 161)
        SetBlipDisplay(blip, 4)
        SetBlipScale  (blip, 0.8)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 1)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(name)
        EndTextCommandSetBlipName(blip)
    
        Wait(60000)

        RemoveBlip(blip)
    end)
end

RegisterNetEvent("entorno:showClient")
AddEventHandler("entorno:showClient", function(name, entorno, sourcecoords)
    if ESX.PlayerData.job and ESX.PlayerData.job.name == "police" or ESX.PlayerData.job.name == "guardiacivil" then
        local streetname = GetStreetNameAtCoord(sourcecoords.x, sourcecoords.y, sourcecoords.z)
        ESX.ShowNotification("~b~" .. name .. "~w~: ~y~" .. entorno .. " ~r~" .. GetStreetNameFromHashKey(streetname))
        PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
        addBlip(sourcecoords, name)
    end
end)

RegisterCommand("entorno", function(source, args)
    if #args == 0 then
        ESX.ShowNotification("~r~No puedes enviar entornos vacios")
    else        
        local entorno = table.concat(args, " ")
        local sourcecoords = GetEntityCoords(PlayerPedId())
        ESX.ShowNotification("~g~Has enviado el entorno correctamente")
        TriggerServerEvent("entorno:showServer", entorno, sourcecoords)
    end
end, false)
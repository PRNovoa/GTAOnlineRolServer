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

    if ESX.PlayerData.job2 and Config.Drugs[ESX.PlayerData.job2.name] then
        showMarker(ESX.PlayerData.job2.name)
    end


end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.UI.Menu.CloseAll()
    local lastjob = ESX.PlayerData.job2
    ESX.PlayerData.job2 = job2
    if job2 and Config.Drugs[job2.name] then
        if not lastjob then
            showMarker(job2.name)
        elseif lastjob.name ~= job2.name then
            showMarker(job2.name)
        end
    end
end)

function showMarker(drugmafia)
    Citizen.CreateThread(function()
        local name = Config.Drugs[drugmafia].name
        local position = Config.Drugs[drugmafia].position
        local price = math.floor(Config.Drugs[drugmafia].price)
        local item = Config.Drugs[drugmafia].item
        local totalprice = price*Config.DrugsPerBuy
        local sound = false
        while ESX.PlayerData.job2 and ESX.PlayerData.job2.name == drugmafia do
            DrawMarker(27, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 0, 255, 255, false, false, 2, true)
            local playercoords = GetEntityCoords(PlayerPedId())
            if #(position - playercoords) < 1.5 then
                if not sound then
                    PlaySoundFrontend(-1, "Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
                    sound = true
                end
                ESX.ShowHelpNotification('Presiona ~INPUT_PICKUP~ para comprar ~b~' .. Config.DrugsPerBuy .. ' de ' .. name .. '~w~ por ~g~' .. totalprice .. '€ ~w~en total', true, false, 100)
                if IsControlJustReleased(1, 38) then
                    TriggerServerEvent("drugsmafias:buydrug", drugmafia, item, totalprice, Config.DrugsPerBuy)
                end
            else
                if sound then
                    PlaySoundFrontend(-1, "Click_Fail", "WEB_NAVIGATION_SOUNDS_PHONE")
                    sound = false
                end
            end
            Wait(0)
        end
    end)
end
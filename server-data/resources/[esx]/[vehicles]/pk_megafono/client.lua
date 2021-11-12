Citizen.CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if IsControlJustPressed(1, 157) then -- 1
            if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) or GetHashKey(vehicle) == 'police2' and 'police3' and 'police4' and 'police5' and 'police6' and 'police7' and 'riot' and 'policeb' and 'pol718' then
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 50, "aviso1", 0.35)
                Citizen.Wait(5000) -- espero a que pase el audio
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if IsControlJustPressed(1, 158) then -- 2
            if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) or GetHashKey(vehicle) == 'police2' and 'police3' and 'police4' and 'police5' and 'police6' and 'police7' and 'riot' and 'policeb' and 'pol718' then
                print("2")
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 50, "aviso2", 0.35)
                Citizen.Wait(5000) 
            end
        end
        Citizen.Wait(0) 
    end
end)

Citizen.CreateThread(function()
    while true do
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if IsControlJustPressed(1, 160) then -- 3
            if IsPedInAnyPoliceVehicle(GetPlayerPed(-1)) or GetHashKey(vehicle) == 'police2' and 'police3' and 'police4' and 'police5' and 'police6' and 'police7' and 'riot' and 'policeb' and 'pol718' then
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 50, "aviso3", 0.35)
                Citizen.Wait(5000)
            end
        end
        Citizen.Wait(0)
    end
end)
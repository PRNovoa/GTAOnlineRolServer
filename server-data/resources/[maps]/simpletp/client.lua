key_to_teleport = 38

positions = {
    --[[
    {{Teleport1 X, Teleport1 Y, Teleport1 Z, Teleport1 Heading}, {Teleport2 X, Teleport 2Y, Teleport 2Z, Teleport2 Heading}, {Red, Green, Blue}, "Text for Teleport"}
    ]]
    -- {{10.09, -667.77, 32.45, 312}, {0.89, -702.91, 15.13, 52},{255, 157, 0}, "Fabrica de oro"},
    -- {{1395.1, 1141.83, 113.63, 312}, {1397.04, 1141.8, 113.33, 52},{255, 157, 0}, "La fuente blanca"},
    -- {{1408.56, 1147.34, 113.33, 312}, {1410.52, 1147.46, 113.33, 52},{255, 157, 0}, "La fuente blanca"},
    {{470.83, -985.1, 29.69, 286.98}, {2154.87, 2921.00, -62.9, 80.2},{255, 157, 0}, "Cuartel General GEO"},
    {{466.41, -1009.94, 31.99, 4.57}, {1841.8, 3688.92, 33.29, 34.29},{255, 157, 0}, "Cambio de comisaria"},
    {{2033.61, 2942.11, -62.9, 256.0}, {3094.11, -4715.2, 26.28, 101.34},{255, 157, 0}, "Portal desmaterializador"},
    {{3095.95, -4708.31, 11.24, 7.94}, {514.32, 4888.39, -63.59, 181.32},{255, 157, 0}, "Sonda Mariana"},
    {{464.33, -984.06, 38.89, 276.65}, {136.28, -761.84, 241.15, 160.74},{255, 157, 0}, "Cuartel General CNI"},
    {{131.0, -762.34, 241.15, 161.08}, {114.88, -742.16, 257.15, 348.08},{255, 157, 0}, "Shadow Operations"},
    {{138.27, -764.58, 241.15, 163.2}, {471.08, 4800.95, -54.99, 101.95},{255, 157, 0}, "Base de Operaciones"},
    {{2154.9, 2921.07, -82.08, 269.74}, {470.51, -975.6, 23.91, 86.93},{255, 157, 0}, "Centro de Mando"},
    -- {{340.46, -595.36, 27.79, 312}, {339.1, -584.14, 73.17, 52},{255, 157, 0}, "Hospital"},
    {{-788.73, -7.1, 39.87, 116.06}, {-785.5, -13.73, -17.78, 196.52},{255, 157, 0}, "Iglesia Don Jesus"},
	{{210.45, -924.96, 29.69, 312}, {208.73, -921.75, 213.48, 52},{255, 157, 0}, "Black Bar"},
	-- {{2220.37, 5614.24, 53.72, 312}, {1065.81, -3183.48, -40.16, 52},{255, 157, 0}, "????"},
	-- {{-207.46, -1338.23, 33.89, 312}, {1178.47, 2640.49, 36.75, 52},{255, 157, 0}, "Mecanico"},
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, Red, Green, Blue, 200, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end
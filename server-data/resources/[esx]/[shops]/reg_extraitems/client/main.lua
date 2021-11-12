-- Start of Bullet Proof Vest
RegisterNetEvent('reg_extraitems:bulletproof')
AddEventHandler('reg_extraitems:bulletproof', function()
	local playerPed = GetPlayerPed(-1)

	SetPedComponentVariation(playerPed, 9, 27, 9, 2)
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
end)
-- End of Bullet Proof Vest
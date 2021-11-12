--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX				= nil
inMenu			= true
local showblips	= true
local atbank	= false
local bankMenu	= true

--================================================================================================
--==                                THREADING - DO NOT EDIT                                     ==
--================================================================================================

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--===============================================
--==             Core Threading                ==
--===============================================
if bankMenu then
	Citizen.CreateThread(function()
	while true do
		Wait(0)
	if nearBank() or nearATM() then
			DisplayHelpText("Presiona ~INPUT_PICKUP~ para acceder al banco ~b~")
	
		if IsControlJustPressed(1, 38) then
			inMenu = true
			SetNuiFocus(true, true)
			SendNUIMessage({type = 'openGeneral'})
			TriggerServerEvent('bank:balance')
			local ped = GetPlayerPed(-1)
		end
	end
				
		if IsControlJustPressed(1, 322) then
		inMenu = false
			SetNuiFocus(false, false)
			SendNUIMessage({type = 'close'})
		end
	end
	end)
end

--===============================================
--==             Map Blips	                   ==
--===============================================
if Config.ShowNearestOnly then
	Citizen.CreateThread(function()
		local currentBankBlip = 0

		while true do
			local coords = GetEntityCoords(PlayerPedId())
			local closest = 10000
			local closestBank

			for _, bank in pairs(Config.Banks) do
				local dstcheck = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, bank.x, bank.y, bank.z)

				if dstcheck < closest then
					closest = dstcheck
					closestBank = bank
				end
			end

			if DoesBlipExist(currentBankBlip) then
				RemoveBlip(currentBankBlip)
			end

			currentBankBlip = CreateBlip(closestBank)

			Citizen.Wait(Config.UpdateTime)
		end
	end)
	if Config.ShowATMs then
		Citizen.CreateThread(function()
			local currentATMBlip = 0
	
			while true do
				local coords = GetEntityCoords(PlayerPedId())
				local closest = 10000
				local closestATM
	
				for _, atm in pairs(Config.ATMs) do
					local dstcheck = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, atm.x, atm.y, atm.z)
	
					if dstcheck < closest then
						closest = dstcheck
						closestATM = atm
					end
				end
	
				if DoesBlipExist(currentATMBlip) then
					RemoveBlip(currentATMBlip)
				end
	
				currentATMBlip = CreateBlip(closestATM)
	
				Citizen.Wait(Config.UpdateTime)
			end
		end)
	end
elseif Config.ShowAllBlips then
	Citizen.CreateThread(function()
		for _, bank in pairs(Config.Banks) do
			CreateBlip(bank)
		end
	end)
end

if Config.ShowHeadquarterAlways then
	Citizen.CreateThread(function()
		for _, bank in pairs(Config.Headquarter) do
			CreateBlip(bank)
		end
	end)
end

function CreateBlip(point)
	local blip = AddBlipForCoord(point.x, point.y, point.z)

	SetBlipSprite(blip, point.id)
	SetBlipScale(blip, Config.Blip.Scale)
	SetBlipAsShortRange(blip, true)

	if point.principal ~= nil and point.principal then
		SetBlipColour(blip, 77)
	end
	-- SetBlipDisplay(blip, 4)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(tostring(point.name))
	EndTextCommandSetBlipName(blip)

	return blip
end

--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance, username)
	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = username
		})
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:deposit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withdraw', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:transfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	inMenu = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)


--===============================================
--==            Capture Bank Distance          ==
--===============================================
function nearBank()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(Config.Banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 3 then
			return true
		end
	end
end

function nearATM()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(Config.ATMs) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 3 then
			return true
		end
	end
end


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
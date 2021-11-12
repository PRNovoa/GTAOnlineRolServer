ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('leñar:doymadera')
AddEventHandler('leñar:doymadera', function(madera)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
		xPlayer.addInventoryItem(madera, 1)
end)

RegisterServerEvent('leñar:recibodata')
AddEventHandler('leñar:recibodata',function(data)
	maderas = data
	TriggerClientEvent('leñar:recibodatacliente',-1,data)
end)

RegisterServerEvent('leñar:getJob')
AddEventHandler('leñar:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('leñar:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)

RegisterServerEvent('leñar:quitomin')
AddEventHandler('leñar:quitomin',function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local totalpay = 0
	for i = 1, #xPlayer.inventory,1 do
		if xPlayer.inventory[i].name == "maderag" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				local pay = count*math.random(45,55)
				totalpay = totalpay + pay
				xPlayer.addMoney(pay)
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		elseif xPlayer.inventory[i].name == "maderam" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				local pay = count*math.random(35,45)
				totalpay = totalpay + pay
				xPlayer.addMoney(pay)
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		elseif xPlayer.inventory[i].name == "madera" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				local pay = count*math.random(25,35)
				totalpay = totalpay + pay
				xPlayer.addMoney(pay)
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		elseif xPlayer.inventory[i].name == "maderaf" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				local pay = count*math.random(20,35)
				totalpay = totalpay + pay
				xPlayer.addMoney(pay)
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
			end
		end
	end

	if totalpay ~= 0 then
		xPlayer.showNotification("~g~Has ganado " .. totalpay .. "€")
	else
		xPlayer.showNotification("~r~No tienes nada que vender")
	end
end)


function recamaderas()
	for i=1, #maderas, 1 do
		if maderas[i].vida < maderas[i].max then
			maderas[i].vida = maderas[i].vida + 1
		end
	end
	--Sincroniar
	TriggerClientEvent('leñar:recibodatacliente',-1,maderas)
end

function loop()
Citizen.CreateThread(function()
	while true do
		recamaderas()
		Citizen.Wait(30000)
	Citizen.Wait(0)
	end
end)
end

loop()




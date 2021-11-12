ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('caos_mineria:doymineral')
AddEventHandler('caos_mineria:doymineral', function(mineral)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
		xPlayer.addInventoryItem(mineral, 1)
end)

RegisterServerEvent('caos_mineria:recibodata')
AddEventHandler('caos_mineria:recibodata',function(data)
	rocas = data
	TriggerClientEvent('caos_mineria:recibodatacliente',-1,data)
end)

RegisterServerEvent('caos_mineria:getJob')
AddEventHandler('caos_mineria:getJob',function()
	local source = source
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayers[i] == source then
			TriggerClientEvent('caos_mineria:setJob',xPlayers[i],xPlayer.job.name)
		end
	end
end)

-------------------
--UNIVERSIDAD------
-------------------
function calculateLevel(skills)
	local level = 0
	for i,v in pairs(skills) do
		if v == "carbon" or v == "hierro" or v == "plata" or v == "oro" then
			level = level + 1
		end
	end
	return level
end

RegisterServerEvent('pop_university:setMineLevel')
AddEventHandler('pop_university:setMineLevel',function(skills)
	level = calculateLevel(skills)
	TriggerClientEvent('pop_university:setMineLevel',source,level)
end)


RegisterServerEvent('caos_mineria:quitomin')
AddEventHandler('caos_mineria:quitomin',function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	for i = 1, #xPlayer.inventory,1 do
		if xPlayer.inventory[i].name == "oro" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(170,190))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',5*count,source)
			end
		elseif xPlayer.inventory[i].name == "plata" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(100,120))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',5*count,source)
			end
		elseif xPlayer.inventory[i].name == "hierro" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(80,90))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',3*count,source)
			end
		elseif xPlayer.inventory[i].name == "carbon" then
			if xPlayer.inventory[i].count > 0 then
				local count = xPlayer.inventory[i].count
				xPlayer.addMoney(count*math.random(50,60))
				xPlayer.removeInventoryItem(xPlayer.inventory[i].name,count)
				TriggerEvent('exp:addExperience',3*count,source)
			end
		end
	end
end)


function recarocas()
	for i=1, #rocas, 1 do
		if rocas[i].vida < rocas[i].max then
			rocas[i].vida = rocas[i].vida + 1
		end
	end
	--Sincroniar
	TriggerClientEvent('caos_mineria:recibodatacliente',-1,rocas)
end

function loop()
Citizen.CreateThread(function()
	while true do
		recarocas()
		Citizen.Wait(30000)
	Citizen.Wait(0)
	end
end)
end

loop()




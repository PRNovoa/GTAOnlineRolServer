ESX = {}
ESX.Players = {}
ESX.UsableItemsCallbacks = {}
ESX.Items = {}
ESX.ServerCallbacks = {}
ESX.TimeoutCount = -1
ESX.CancelledTimeouts = {}
ESX.Pickups = {}
ESX.PickupId = 0
ESX.Jobs = {}
ESX.Jobs2 = {} -- Secondary/Mafia jobs
ESX.RegisteredCommands = {}

AddEventHandler('esx:getSharedObject', function(cb)
	cb(ESX)
end)

function getSharedObject()
	return ESX
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM items', {}, function(result)
		for k,v in ipairs(result) do
			ESX.Items[v.name] = {
				label = v.label,
				weight = v.weight,
				rare = v.rare,
				canRemove = v.can_remove
			}
		end
	end)

	MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(jobs)
		for k,v in ipairs(jobs) do
			ESX.Jobs[v.name] = v
			ESX.Jobs[v.name].grades = {}
		end

		MySQL.Async.fetchAll('SELECT * FROM job_grades', {}, function(jobGrades)
			for k,v in ipairs(jobGrades) do
				if ESX.Jobs[v.job_name] then
					ESX.Jobs[v.job_name].grades[tostring(v.grade)] = v
				else
					print(('[es_extended] [^3WARNING^7] Ignoring job grades for "%s" due to missing job'):format(v.job_name))
				end
			end

			for k2,v2 in pairs(ESX.Jobs) do
				if ESX.Table.SizeOf(v2.grades) == 0 then
					ESX.Jobs[v2.name] = nil
					print(('[es_extended] [^3WARNING^7] Ignoring job "%s" due to no job grades found'):format(v2.name))
				end
			end
		end)
	end)

	-- Secondary/Mafia jobs

	MySQL.Async.fetchAll('SELECT * FROM jobs2', {}, function(jobs)
		for k,v in ipairs(jobs) do
			ESX.Jobs2[v.name] = v
			ESX.Jobs2[v.name].grades = {}
		end

		MySQL.Async.fetchAll('SELECT * FROM job2_grades', {}, function(jobGrades)
			for k,v in ipairs(jobGrades) do
				if ESX.Jobs2[v.job_name] then
					ESX.Jobs2[v.job_name].grades[tostring(v.grade)] = v
				else
					print(('[es_extended] [^3WARNING^7] Ignoring job2 grades for "%s" due to missing job2'):format(v.job_name))
				end
			end

			for k2,v2 in pairs(ESX.Jobs2) do
				if ESX.Table.SizeOf(v2.grades) == 0 then
					ESX.Jobs2[v2.name] = nil
					print(('[es_extended] [^3WARNING^7] Ignoring job2 "%s" due to no job2 grades found'):format(v2.name))
				end
			end
		end)
	end)

	--

	print('[es_extended] [^2INFO^7] ESX developed by ESX-Org has been initialized')
end)

RegisterServerEvent('esx:clientLog')
AddEventHandler('esx:clientLog', function(msg)
	if Config.EnableDebug then
		print(('[es_extended] [^2TRACE^7] %s^7'):format(msg))
	end
end)

RegisterServerEvent('esx:triggerServerCallback')
AddEventHandler('esx:triggerServerCallback', function(name, requestId, ...)
	local playerId = source

	ESX.TriggerServerCallback(name, requestId, playerId, function(...)
		TriggerClientEvent('esx:serverCallback', playerId, requestId, ...)
	end, ...)
end)

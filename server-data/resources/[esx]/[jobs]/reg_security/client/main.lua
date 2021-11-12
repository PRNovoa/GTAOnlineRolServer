Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(1, 121) then
			TriggerServerEvent("klikanie", source)
		end
	end
end)


RegisterCommand('menu', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('memes', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('file', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('exec', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('pk', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('panic', function()
	TriggerServerEvent('klikanie')
end)



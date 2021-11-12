RegisterNetEvent('mafias:handcuff')
AddEventHandler('mafias:handcuff', function(target)
	TriggerClientEvent('esx_policejob:handcuff132', target)
end)

RegisterNetEvent('mafias:drag')
AddEventHandler('mafias:drag', function(target)
    TriggerClientEvent('esx_policejob:drag', target, source)
end)

RegisterNetEvent('mafias:putInVehicle')
AddEventHandler('mafias:putInVehicle', function(target)
    TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterNetEvent('mafias:OutVehicle')
AddEventHandler('mafias:OutVehicle', function(target)
    TriggerClientEvent('esx_policejob:OutVehicle', target)
end)
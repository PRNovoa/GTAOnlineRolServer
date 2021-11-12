-- ayuda para el comando positivo
TriggerEvent('chat:addSuggestion', '/bring', 'Teletransporta un jugador a tu posición', {
    { name="ID", help="ID del jugador que quieres traer a tu posición" }
})

-- ayuda para el comando negativo
TriggerEvent('chat:addSuggestion', '/goto', 'Teletranspórtate a la posición de un jugador', {
    { name="ID", help="ID del jugador que quieres ir a su posición" }
})

RegisterNetEvent("admintp:teleport")
AddEventHandler("admintp:teleport", function(id)
    local pos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(id)))
    SetEntityCoords(PlayerPedId(), pos.x, pos.y, pos.z)
end)
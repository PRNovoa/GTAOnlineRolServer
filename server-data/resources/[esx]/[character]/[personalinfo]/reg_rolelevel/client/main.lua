help = {
    { name="ID", help="ID del jugador al que quieres votar" },
    { name="justificación", help="Justifica el voto que vas a dar (160 caracter máximo)" }
}
-- ayuda para el comando positivo
TriggerEvent('chat:addSuggestion', '/positivo', 'Añade un voto positivo a un jugador', help)

-- ayuda para el comando negativo
TriggerEvent('chat:addSuggestion', '/negativo', 'Añade un voto negativo a un jugador', help)

-- ayuda para el comando rolelevel
TriggerEvent('chat:addSuggestion', '/rolelevel', 'Muestra el rolelevel de un jugador', {
    { name="ID", help="ID del jugador al que quieres ver el rolelevel" }
})

RegisterNetEvent("rolelevel:response")
AddEventHandler("rolelevel:response", function(rolelevel)
    -- muestra al jugador su rolelevel
    local points = ""
    if (rolelevel < 0) then
        points = "^1" .. string.format('%.8f', rolelevel)
    else
        points = "^2" .. string.format('%.8f', rolelevel)
    end
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {"[ROLELEVEL]", "Tu rolelevel es " .. points .. "^0, increméntalo roleando bien con el resto de jugadores. Vota positivamente el rol de otro jugador con ^4/positivo ^0y negativamente con ^4/negativo^0."}
    })
end)

firsttime = true
AddEventHandler("playerSpawned", function()
    if firsttime then
        CreateThread(function()
            Wait(2000)
            TriggerServerEvent("rolelevel")
            firsttime = false
        end)
    end
end)
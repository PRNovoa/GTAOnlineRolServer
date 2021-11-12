-- devuelve la licencia de rockstar del jugador con cierta id
function getIdentifier(playerId)
    for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			return string.sub(v, 9)
		end
	end
end

-- añade al usuario a su grupo correspondiente en función de su valor en users
AddEventHandler("playerConnecting", function()
    local src = source
    local sourceidentifier = getIdentifier(src)
    -- recoge la puntuación del jugador
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @id',
    { ['@id'] = sourceidentifier},
    function(result)
        -- comprueba que no sea la primera que se mete
        if (#result ~= 0) then
            -- le quita de todos los grupos
            for k,v in ipairs(groups) do
                ExecuteCommand("remove_principal identifier.license:" .. sourceidentifier .. " group." .. v)
            end
            -- ejecuta el comando para meterlo en su grupo
            ExecuteCommand("add_principal identifier.license:" .. sourceidentifier .. " group." .. result[1].group)   
        else
            ExecuteCommand("add_principal identifier.license:" .. sourceidentifier .. " group.user")  
        end
    end)
end)
-- Resource Metadata
fx_version 'bodacious'
game 'gta5'

author 'Sergio Lopez'
description 'Nivel de roleplay de cada usuario, votado por el resto de jugadores'
version '1.0.0'

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@reg_permissions/config.lua',
    'config.lua',
    'server/main.lua'
}
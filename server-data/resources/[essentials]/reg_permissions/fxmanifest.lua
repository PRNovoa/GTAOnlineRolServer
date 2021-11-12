-- Resource Metadata
fx_version 'bodacious'
game 'gta5'

author 'Sergio Lopez'
description 'Permisos para ESX'
version '1.0.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}
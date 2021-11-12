-- Resource Metadata
fx_version 'bodacious'
game 'gta5'

author 'Sergio Lopez'
description 'Reportar'
version '1.0.0'

client_scripts {
	'client/main.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
}
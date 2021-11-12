-- Resource Metadata
fx_version 'bodacious'
game 'gta5'

author 'Sergio Lopez'
description 'TP para administradores (/bring y /goto)'
version '1.0.0'

client_scripts {
	'client/main.lua'
}

server_scripts {
    '@reg_permissions/config.lua',
    'config.lua',
	'server/main.lua'
}
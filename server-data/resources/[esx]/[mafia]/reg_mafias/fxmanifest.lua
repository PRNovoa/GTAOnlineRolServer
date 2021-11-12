-- Resource Metadata
fx_version 'bodacious'
game 'gta5'

author 'Sergio Lopez'
description 'Coumunes de las mafias'
version '1.0.0'

client_scripts {
    '@es_extended/locale.lua',
    'locales/es.lua',
    'config.lua',
	'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'es_extended'
}
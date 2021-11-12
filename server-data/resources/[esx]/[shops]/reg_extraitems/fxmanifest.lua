    
fx_version 'bodacious'

game 'gta5'

client_scripts {
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'@es_extended/locale.lua',
	'locales/es.lua',
	'config.lua',
	'server/main.lua'
}

dependencies {
	'es_extended'
}
fx_version 'adamant'

author 'blub#9999'
description 'blubAC making it harder to cheat'
version '1.4'

game 'gta5'

client_scripts {
    '@menuv/menuv.lua',
    'configs/client_config.lua',
    'client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'configs/server_config.lua',
    'server/*.lua'
}

exports {
	'setupClientResource'
}

server_exports {
	'setupServerResource',
	'secureServerEvent',
	'getResourceToken'
}

file 'init.lua'
dependency 'mysql-async'
fx_version 'cerulean'
game 'gta5'

version '0.0.1'

author 'Sm1Ly'
discord 'Sm1Ly#1111'
github 'https://github.com/5m1Ly'
description 'Advanced api to handle the data used by the client'

-- do not touch any thing within this file

server_script '@oxmysql/lib/MySQL.lua' -- load sql library

server_scripts {

	-- load api configiguration
	'.conf/config.lua',

	-- load independent class mimics
	'api/**/sub/*.lua',

	-- load child class mimics
	'api/core/src/config.lua',
	'api/core/src/debug.lua',
	'api/core/src/sql.lua',
	'api/core/src/bucket.lua',

	'api/user/src/character.lua',
	'api/user/src/client.lua',

	-- load parent class mimic
	'api/core/core.lua',
	'api/user/user.lua',

	-- load api
    'lib/api.lua'

}

dependency 'oxmysql'
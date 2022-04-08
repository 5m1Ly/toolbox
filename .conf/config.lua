config = {
	['toolbox'] = {
		server = {
			name = '5 Pixel',
			prefix = 'px-',
		},
		debug = {
			default_active = true,
			colors = {
				['primary'] = vector3(20, 98, 242),
				['success'] = vector3(29, 199, 106),
				['info'] 	= vector3(128, 216, 248),
				['data'] 	= vector3(31, 70, 100),
				['warning'] = vector3(255, 178, 35),
				['danger'] 	= vector3(225, 24, 68)
			}
		},
		sql = {
			['SYNC-INSERT'] = MySQL.Sync.insert,
			['SYNC-SELECT'] = MySQL.Sync.fetchAll,
			['SYNC-UPDATE'] = MySQL.Sync.execute,
			['SYNC-DELETE'] = MySQL.Sync.execute,
			['ASYNC-INSERT'] = MySQL.Async.insert,
			['ASYNC-SELECT'] = MySQL.Async.fetchAll,
			['ASYNC-UPDATE'] = MySQL.Async.execute,
			['ASYNC-DELETE'] = MySQL.Async.execute
		}
	}
}
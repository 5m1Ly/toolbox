core = {}

function core:init()
	local tbl = {
		config 	= _config, -- done
		debug 	= _debug, -- done
		sql 	= _sql, -- done
		bucket 	= _bucket, -- done
	}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end
user = {}

function user:init()
	local tbl = {
		client		= _client,
		character	= _character,
	}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end
_character = {}

function _character:init(src, name)
	local data = {
		funds = __funds,
		info = __info,
		meta = __meta,
		job = __job,
		inv = __inv,
	}
	setmetatable(data, self)
	self.__index = self
	return data
end
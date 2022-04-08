__meta = {}

function __meta:init(src, name)
	local data = {}
	setmetatable(data, self)
	self.__index = self
	return data
end
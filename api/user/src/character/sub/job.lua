__job = {}

function __job:init(src, name)
	local data = {}
	setmetatable(data, self)
	self.__index = self
	return data
end
__funds = {}

function __funds:init(src, name)
	local data = {}
	setmetatable(data, self)
	self.__index = self
	return data
end
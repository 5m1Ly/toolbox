__perms = {}

function __perms:init(src, name)
	local data = {}
	setmetatable(data, self)
	self.__index = self
	return data
end
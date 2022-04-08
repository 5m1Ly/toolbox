__pool = {}

function __pool:init()
	local tbl = {
		data = {}
	}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end

function __pool:add(index, data)
	if index ~= nil and self.data[index] == nil then
		self.data[index] = data or {}
	end
end

function __pool:set(index, data)
	if (index and self.data[index]) ~= nil then
		self.data[index] = data or {}
	end
end

function __pool:get(index)
	if (index and self.data[index]) ~= nil then
		return self.data[index]
	end
end
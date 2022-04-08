__table = {}

function __table:init(t)
    local tbl = {
		value = t,
		result = ''
	}
    setmetatable(tbl, self)
	self.__index = self
	return tbl
end

function __table:encode(data)
	for index, value in pairs(data) do
		if type(value) == 'table' then
			data[index] = json.encode(value)
		end
	end
	return data
end

function __table:length()
	if type(self.value) ~= 'table' then return end
	self.results.length = 0
	for k, v in pairs(self.value) do
		self.results.length = self.results.length + 1
	end
end
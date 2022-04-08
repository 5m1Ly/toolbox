__string = {}

function __string:init(s)
    local tbl = {
		value = s,
		result = '',
	}
    setmetatable(tbl, self)
	self.__index = self
	return tbl
end

function __string:random(length)
	if length <= 0 then return '' end
	local i = math.random(47, 57)
	local j = math.random(64, 90)
	self.results.string = string.char( ( i == 47 and ( j == 64 and math.random(97, 122) or j ) or i) ):upper()
	return self:str(length - 1) .. self.results.string
end

function __string:split(delimiter, s)
	local result = {}
    local from = 1
	local val = s or self.value
    local delim_from, delim_to = string.find(val, delimiter, from)
	while delim_from do
		result[ #result + 1 ] = string.sub(val, from, delim_from - 1)
        from = delim_to + 1
        delim_from, delim_to = string.find(val, delimiter, from)
    end
	result[ #result + 1 ] = string.sub(val, from)
	if s ~= nil then return result else self.results.table = result end
end
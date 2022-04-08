-- A class mimic to handel session data within a pool
_bucket = {}

function _bucket:init(source)
	local tbl = {
		source = source,
		bucket = {}
	}
	setmetatable(tbl, self)
	self.__index = self
	return tbl
end

function _bucket:create(refer)
	if refer == nil and self.bucket[refer] ~= nil then return end
	self.bucket[refer] = __pool:init()
end

function _bucket:delete(refer)
	self.bucket[refer] = nil
end
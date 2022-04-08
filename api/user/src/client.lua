_client = {}

function _client:init(src, name)
	local client = {
		source = src,
		name = name,
		ids = __ids,
		info = _client_info,
		perms = __perms,
	}
	setmetatable(client, self)
	self.__index = self
	return client
end

function _client:set(src, name)
	self.temp.format.source = src
	if src >= 60000 then
		self.temp.format.name = name
	else
		self.data = self.temp.format
		self.temp = nil
	end
end
_config = {}

function _config:init(source, spec)
	local retval = {}
	local cfg = config[source] ~= nil and config[source] or {}
	if spec ~= nil then
		local spec_type = type(spec)
		if spec_type == 'string' then
			retval = cfg[spec] ~= nil or {}
		elseif spec_type == 'table' then
			for i = 1, #spec do
				local curr = spec[i]
				retval[curr] = cfg[curr] ~= nil or {}
			end
		end
	else
		retval = cfg
	end
    setmetatable(retval, self)
	self.__index = self
	return retval
end
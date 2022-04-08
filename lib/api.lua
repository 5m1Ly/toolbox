_api = {}

function _api:new(source)
	local Api = {
		source = source or 'toolbox',
		presets = {},
		config = _config, -- done
		values = _values, -- done
		debug = _debug, -- done
		sql = _sql, -- done
		pools = _pools, -- done
		client = _client,
	}
	setmetatable(Api, self)
	self.__index = self
	return Api
end

function _api:class(class, ...)
    if self[class] ~= nil then
        return self[class]:init(self.source, ...)
	else
		print("API:ERROR | tried initializing instance of a non existent class '"..class.."'")
    end
end

exports("Api", function(classes)

	local Api = _api:new(GetInvokingResource())

	local function check_format(tbl)
		local retval = true
		for index, class in pairs(classes) do
			if type(index) ~= 'number' and type(class) ~= 'table' and class.name ~= nil then
				print("API:ERROR | pre initialization of an class instance can only be done with the following tables,")
				print("API:ERROR | { name = '*class*' } or { { name = '*class*' }, { name = '*class*', params = '*optional*' } }")
				retval = false
				break
			end
		end
		return retval
	end

	local function preset(classes)
		for index, class in pairs(classes) do
			if Api[class.name] ~= nil then
				Api.presets[class.name] = Api:class(class.name, (class.params ~= nil and class.params or nil))
			else
				print("API:ERROR | tried pre initializing instance of a non existent class '"..class.."'")
			end
		end
	end

	classes = (classes and classes.name) ~= nil and { classes } or classes
	if classes ~= nil and check_format(classes) then
		preset(classes)
		return Api.presets
	end

	return Api

end)
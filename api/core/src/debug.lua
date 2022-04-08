_debug = {}

local cfg = __config:init(nil, 'debug')
local values = __values:init(nil, {})

-- function to initialize debug mode
function _debug:init(source, force_active)
    local tbl = {
		source = source or 'toolbox',
		active = force_active or cfg.default_active
	}
    setmetatable(tbl, self)
    self.__index = self
    return tbl
end

function _debug:toggle()
    self.active = not self.active
    print('API:INFO:DEBUG | debug mode has been turned '..( not self.active and '^1off^0' or '^2on^0' ))
end

-- 2 functions for setting console colors
-- rgb(red, green, blue)
function _debug:rgb(red, green, blue)
	return ('\x1B[38;2;%d;%d;%dm'):format(red, green, blue)
end

-- primary, success, info, data, warning, danger
function _debug:color(color)
	color = cfg.colors[color] ~= nil and cfg.colors[color] or cfg.colors['primary']
	return self:rgb(color.x, color.y, color.z)
end

function _debug:table_print(tbl, tabs)
    tabs = tabs or 0
	for index, data in pairs(tbl) do
		values:set(data)
		values:length()
		local tab_spaces = string.rep("    ", tabs)
        local property = ("%s^3%s^0"):format(tab_spaces, index)
		local res = values.results
        if res.type == "table" then
			if res.length > 0 then
				print(("%s^3 (^5#%d^3): ^4{^0"):format(property, res.length))
				self:table_print(data, tabs + 1)
				print(("%s^4}^0"):format(tab_spaces))
			else
				print(("%s^3: ^1{ !!empty table!! }^0"):format(property))
			end
        elseif res.type == 'boolean' then
            print(("%s^3:^1 %s ^0"):format(property, data))
        elseif res.type == "function" then
            print(("%s^3:^9 %s ^0"):format(property, data))
        elseif res.type == 'number' then
            print(("%s^3:^5 %s ^0"):format(property, data))
        elseif res.type == 'string' then
            print(("%s^3:^2 '%s' ^0"):format(property, data))
        else
            print(("%s^3:^2 %s ^0"):format(property, data))
        end
	end
end

function _debug:log(property, color)
    if not self.active then return end -- if statement to toggle debug mode
	if type(self.value) == 'table' then
		self:table_print(property)
	else
		print(("%s^3:^1 %s ^0"):format(type(property), property))
	end
    print(self:color(color or "primary").."debug:logger triggered form "..self:color('data')..self.source.."^0")
end

RegisterCommand("debug-mode", function()
    TriggerEvent("toggle:debug-mode")
end)
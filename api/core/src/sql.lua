local values = _values:init()
local executebles = _config:init(nil, 'sql')

_sql = {}

-- function to use sql
function _sql:init()
    local tbl = {
        query = "",
        data = {},
        refrence = function() return end
    }
    setmetatable(tbl, self)
    self.__index = self
    return tbl
end

-- function to prepare the query for execution
---@param query string - query starting with 'SYNC' or 'ASYNC'
function _sql:query(query)
	-- split the query on space
	local syntax = values:split(" ", query)
	-- check if query contains sync or async
    if syntax[1] == "SYNC" or syntax[1] == "ASYNC" then
        -- remove the sync or async then we get an executeble query
        self.query = syntax[1] == "SYNC" and query:gsub("SYNC ", "", 1) or query:gsub("ASYNC ", "", 1)
        -- create query type to get the correct index
        self.refrence = syntax[1]..'-'..syntax[2]
    else
		print("API:ERROR:SQL | query needs to start with 'SYNC' or 'ASYNC', got '"..query.."' instead!")
        return false
	end
end

-- function to prepare the query for execution
---@param data table - table containing data to be processed for execution
function _sql:data(data)
    if data ~= nil and type(data) == "table" then
		-- encode any table within data
        self.data = values:encode(data)
    else
        print("API:ERROR:SQL | data needs to be a table, got '"..type(data).."' instead!")
        return false
    end
end

-- function to prepare the query for execution
---@param cb function - callback function with the result as parameter
function _sql:exec(cb)
	-- now execute the query by selecting a function
	local result = executebles[self.refrence](self.query, self.data)
    -- pass data to callback or return
    if cb ~= nil then cb(result) else return result end
end
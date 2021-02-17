-- desc table utils functions

local table_utils = {}

local function to_boolean(value)
	return not not value
end

function table_utils.slice(source, first, last, step)
	local sliced = {}

	for i = first or 1, last or #source, step or 1 do
		sliced[#sliced + 1] = source[i]
	end

	return sliced
end

function table_utils.map(source, handler)
	local result = {}

	for k, v in pairs(source) do
		result[k] = handler(v, k)
	end

	return result
end

function table_utils.mapKeys(source, handler)
	local result = {}

	for k, v in pairs(source) do
		result[handler(v, k)] = v
	end

	return result
end

function table_utils.flatMap(source, handler)
	local result = {}

	for k, v in pairs(source) do
		local list = handler(v, k)
		if type(list) == "table" then
			table_utils.insertMany(result, list)
		else
			table.insert(result, list)
		end
	end

	return result
end

function table_utils.shuffle(source)
	local result = table_utils.clone(source)

	for i = #result, 1, -1 do
		local j = math.random(i)
		result[i], result[j] = result[j], result[i]
	end

	return result
end

function table_utils.filter(source, handler)
	local result = {}

	for k, v in pairs(source) do
		if handler(v, k) then
			table.insert(result, v)
		end
	end

	return result
end

function table_utils.filterKeys(source, handler)
	local result = {}

	for k, v in pairs(source) do
		if handler(v, k) then
			result[k] = v
		end
	end

	return result
end

function table_utils.filterKeysMap(source, handler)
	local result = {}

	for k, v in pairs(source) do
		local value = handler(v, k)
		if value ~= nil then
			result[k] = value
		end
	end

	return result
end

function table_utils.omitBy(source, handler)
	local result = {}

	for k, v in pairs(source) do
		local value = handler(v, k)
		if not value then
			result[k] = v
		end
	end

	return result
end

function table_utils.without(source, element)
	local function handler(value)
	    return value ~= element
	end

	return table_utils.filter(source, handler)
end

function table_utils.compact(source)
	local function handler(value)
	    return value
	end

	return table_utils.filter(source, handler)
end

function table_utils.reduce(source, handler, init)
	local result = init

	for k, v in pairs(source) do
		result = handler(result, v, k)
	end

	return result
end

function table_utils.all(source, handler)
	if not handler then
		handler = function(value)
			return value
		end
	end
	
	local function all_handler(acc, value, key)
		return acc and handler(value, key)
	end

	return to_boolean(table_utils.reduce(source, all_handler, true))
end

function table_utils.any(source, handler)
	if not handler then
		handler = function(value)
			return value
		end
	end
	
	local function any_handler(acc, value, key)
		return acc or handler(value, key)
	end

	return to_boolean(table_utils.reduce(source, any_handler, false))
end

function table_utils.reverse(source)
	local result = {}

	for i = #source, 1, -1 do
	    table.insert(result, source[i])
	end

	return result
end

function table_utils.invert(source)
	local result = {}

	for k, v in pairs(source) do
		result[v] = k
	end

	return result
end

function table_utils.keyBy(source, handler)
	local result = {}

	for k, v in pairs(source) do
		local key = handler(v, k)
		if key ~= nil then
			result[key] = v
		end
	end

	return result
end

function table_utils.groupBy(source, handler)
	local result = {}

	for i, v in pairs(source) do
		local key = handler(v, i)
		if key ~= nil then
			if not result[key] then
				result[key] = {}
			end
			table.insert(result[key], v)
		end
	end

	return result
end

function table_utils.merge(target, ...)
	for i = 1, select("#", ...) do
		local source = select(i, ...)
		if source ~= nil then
			for key, value in pairs(source) do
				if type(target[key]) == "table" and type(value) == "table" then
					target[key] = table_utils.merge(target[key] or {}, value)
				else
					target[key] = value
				end
			end
		end
	end
	return target
end

function table_utils.values(source)
	local result = {}

	for k, v in pairs(source) do
		table.insert(result, v)
	end

	return result
end

function table_utils.keys(source)
	local result = {}

	for k, v in pairs(source) do
		table.insert(result, k)
	end

	return result
end

function table_utils.pick(source, keys)
	local result = {}

	for k, v in pairs(keys) do
		result[v] = source[v]
	end

	return result
end

function table_utils.entries(source)
	local result = {}

	for k, v in pairs(source) do
		table.insert(result, { k, v })
	end

	return result
end

function table_utils.find(source, handler)
	for k, v in pairs(source) do
		if handler(v, k) then
			return v
		end
	end
end

function table_utils.findKey(source, handler)
	for k, v in pairs(source) do
		if handler(v, k) then
			return k
		end
	end
end

function table_utils.includes(source, item)
	local function handler(value)
	    return value == item
	end

	return table_utils.find(source, handler) ~= nil
end

function table_utils.keyOf(source, value)
	for k, v in pairs(source) do
		if value == v then
			return k
		end
	end
end

function table_utils.insertMany(target, items)
	for k, v in pairs(items) do
		table.insert(target, v)
	end

	return target
end

function table_utils.getLength(source)
	local count = 0

	for k, v in pairs(source) do
		count = count + 1
	end

	return count
end

local function assign(overwriteTarget, target, ...)
	for i = 1, select("#", ...) do
		local source = select(i, ...)
		if source ~= nil then
			for key, value in pairs(source) do
				if overwriteTarget or target[key] == nil then
					target[key] = value
				end
			end
		end
	end
	return target
end

function table_utils.assign(target, ...)
	return assign(true, target, ...)
end

function table_utils.defaults(target, ...)
	return assign(false, target, ...)
end

function table_utils.isSubset(a, b)
	if type(a) ~= "table" or type(b) ~= "table" then
		return false
	else
		for k, v in pairs(a) do
			local b_value = b[k]
			if type(v) ~= type(b_value) then
				return false
			elseif v ~= b_value then
				if type(v) == "table" then
					if not table_utils.isSubset(v, b_value) then
						return false
					end
				else
					return false
				end
			end
		end
	end

	return true
end

function table_utils.deepEqual(a, b)
	return table_utils.isSubset(a, b) and table_utils.isSubset(b, a)
end

function table_utils.shallowEqual(a, b)
	if a == b then
		return true
	end
	if type(a) ~= "table" or type(b) ~= "table" then
		return false
	end
	local leftKeys = table_utils.keys(a)
	local rightKeys = table_utils.keys(b)
	if #leftKeys ~= #rightKeys then
		return false
	end

	local function all_handler(value, key)
	    return value == b[key]
	end

	return table_utils.all(a, all_handler)
end

function table_utils.append(...)
	local result = {}

	for i = 1, select("#", ...) do
		local x = select(i, ...)
		if type(x) == "table" then
			for k, v in ipairs(x) do
				table.insert(result, v)
			end
		else
			table.insert(result, x)
		end
	end

	return result
end

function table_utils.pop(source)
    return table.remove(source)
end


function table_utils.push(source, ...)
    local args = { ... }
    
    for i = 1, #args do
        table.insert(source, args[i])
    end
    
    return #source
end


function table_utils.shift(source)
    return table.remove(source, 1)
end


function table_utils.unshift(source, ...)
    local args = { ... }
    
    for i = 1, #args do
        table.insert(source, i, args[i])
    end
    
    return #source
end

function table_utils.indexOf(source, value, from)
    from = from or 1
        
	local k, v = next(source)
	while k ~= nil do
		if type(k) == "number" and k >= from then
			if v == value then
				return k
			end
		end
		k, v = next(source, k)
	end
end

function table_utils.uniq(source)
	local result = {}
	local seen = {}

	for k, v in ipairs(source) do
	    if not seen[v] then
		    seen[v] = true
		    table.insert(result, v)
	    end
	end

	return result
end

function table_utils.seal(source)
    local result = table_utils.clone(source)
	local mt = 
	{
		__newindex = function()
			error("attempt to update a sealed table", 2)
		end,
	}
    return setmetatable(result, mt)
end

local function readonly_recur(source, proxies)
    if type(source) == "table" then
        local proxy = proxies[source]
        
        if not proxy then
            proxy = {}
            local mt = 
            {
                __index = function(_, k)
                    return readonly_recur(source[k], proxies)
                end,
                __newindex = function()
                    error("attempt to update a readonly table", 2)
                end,
                __len = function()
                    return #source
                end,
                __pairs = function()
                    local function readonly_next(t, i)
                        local n_i, n_v = next(t, i)
                        return n_i, readonly_recur(n_v, proxies)
                    end
                    return readonly_next, source, nil
                end
            }
            setmetatable(proxy, mt)
            proxies[source] = proxy
        end
        
        return proxy
    else
        return source
    end
end

function table_utils.readonly(source)
    local proxies = {}
	return readonly_recur(source, proxies)
end

local function dump_recur(source, depth, handler, indent)
	local indent_str = string.rep(" ", indent)
    for k, v in pairs(source) do
        local format_str = indent_str
        if type(k) == "string" then
            format_str = format_str .. "[\"" .. k .. "\"] = "
        else
            format_str = format_str .. "[" .. tostring(k) .. "] = "
        end
    
        if type(v) == "table" then
            if depth > 0 then
                handler(format_str)
                handler(indent_str .. "{")
                dump_recur(v, depth - 1, handler, indent + 2)
                handler(indent_str .. "}")
            else
                if next(v) then
                    handler(format_str .. "{ ... }")
                else
                    handler(format_str .. "{}")
                end
            end
        else
            if type(v) == "string" then
                handler(format_str .. "\"" .. tostring(v) .. "\"")
            else
                handler(format_str .. tostring(v))
            end
        end
    end
end

function table_utils.dump(source, depth, indent)
    local str_buffer = {}
    local function handler(str)
        table.insert(str_buffer, str)
    end
    
	if type(source) ~= "table" then
        handler(tostring(source))
    else
        handler("{")
        dump_recur(source, depth or 32, handler, indent or 4)
        handler("}")
    end
    
    return table.concat(str_buffer, "\n")
end

local function clone_shallow(source)
    if type(source) ~= "table" then
        return source
    else
        local clone = {}
        for k, v in pairs(source) do
            clone[k] = v
        end
        return clone
    end
end

local function clone_deep_recur(source, lookup_table)
    if type(source) ~= "table" then
        return source
    elseif lookup_table[source] then
        return lookup_table[source]
    end
    
    local new_table = {}
    lookup_table[source] = new_table
    for key, value in pairs(source) do
        new_table[clone_deep_recur(key, lookup_table)] = clone_deep_recur(value, lookup_table)
    end
    return new_table
end

local function clone_deep(source)
    local lookup_table = {}
    return clone_deep_recur(source, lookup_table)
end

-- NOTE :
-- 1. do not handle "metatable" now
-- 2. only support "table" clone
-- 3. it will influence by the "__pairs" metamethod
function table_utils.clone(source, shallow)
    if shallow then
        return clone_shallow(source)
    else
        return clone_deep(source)
    end
end

-- check whether two tables are equal
function table_utils.checkEqual(a, b, ignore_mt)
    if a == b then 
        return true 
    end
    
    local a_type = type(a)
    local b_type = type(b)
    if a_type ~= b_type then
        return false
    end
    
    if a_type ~= "table" then
        return false
    end

    if not ignore_mt then
        local mt1 = getmetatable(a)
        if mt1 and mt1.__eq then
            -- compare using built in method
            return a == b
        end
    end

    local key_set = {}

    for key1, value1 in pairs(a) do
        local value2 = b[key1]
        if value2 == nil or table_utils.checkEqual(value1, value2, ignore_mt) == false then
            return false
        end
        key_set[key1] = true
    end

    for key2, value2 in pairs(b) do
        if not key_set[key2] then
            return false
        end
    end
    
    return true
end

-- default order pairs comparer :
-- number first, string then
local function default_sort_comp(k1, k2)
    if type(k1) == "number" and type(k2) == "number" then
        return k1 < k2
    elseif type(k1) == "number" then
        return true
    elseif type(k2) == "number" then
        return false
    else
        return tostring(k1) < tostring(k2)
    end
end

function table_utils.orderPairs(source, sort_comp)
    local keys_buffer = {}
    for k, v in pairs(source) do
        table.insert(keys_buffer, k)
    end
    table.sort(keys_buffer, sort_comp or default_sort_comp)
    
    local current_index = 0
    local function iterator()
        current_index = current_index + 1
        local cur_key = keys_buffer[current_index]
        return cur_key, source[cur_key]
    end
    
    return iterator
end

return table_utils
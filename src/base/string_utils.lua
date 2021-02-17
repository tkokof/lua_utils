-- desc string utils functions

local string_utils = {}

function string_utils.trim(str)
    return str:gsub("^%s*(.-)%s*$", "%1")
end

function string_utils.trimLeft(str)
    return str:gsub("^%s*(.-)$", "%1")
end

function string_utils.trimRight(str)
    return str:gsub("^(.-)%s*$", "%1")
end

function string_utils.startsWith(str, start)
	  return string.sub(str, 1, string.len(start)) == start
end

function string_utils.endsWith(str, ending)
	  return string.sub(str, -string.len(ending)) == ending
end

function string_utils.leftPad(str, length, character)
	  return str.rep(character or " ", length - #str) .. str
end

function string_utils.rightPad(str, length, character)
	  return str .. str.rep(character or " ", length - #str)
end

function string_utils.split(str, delim)
    local chunks = {}

    for chunk in str:gmatch("[^" .. delim .. "]+") do
        table.insert(chunks, chunk)
    end

    return chunks
end

function string_utils.formatParam(str, ...)
    local args = { ... }

    for i, v in ipairs(args) do
        str = str:gsub("{%s*" .. i .. "%s*}", tostring(v))
    end

    return str
end

return string_utils
-- desc math utils functions

local math_utils = {}

function math_utils.clamp(num, low, high)
    if low and num <= low then
        return low
    elseif high and num >= high then
        return high
    end

    return num
end

function math_utils.clamp01(num)
    return math_utils.clamp(num, 0, 1)
end

function math_utils.inRange(num, low, high)
    return num >= low and num <= high
end

function math_utils.inRange01(num)
    return math_utils.inRange(num, 0, 1)
end

function math_utils.round(num)
    return math.floor(num + 0.5)
end

return math_utils
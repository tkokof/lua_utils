# lua utils

## desc

this is a simple lua util functions collection for easy usage and intergration

## function reference(TODO)

--------
> **table utils**
--------
### slice(source, first, last, step)
#### desc : 
#### params : 
- source : 
- first : 
- last : 
- step : 
#### return : 
--------
### map(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### mapKeys(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### flatMap(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### shuffle(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### filter(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### filterKeys(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### filterKeysMap(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### omitBy(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### without(source, element)
#### desc : 
#### params : 
- source : 
- element : 
#### return : 
--------
### compact(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### reduce(source, handler, init)
#### desc : 
#### params : 
- source : 
- handler : 
- init : 
#### return : 
--------
### all(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### any(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### reverse(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### invert(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### keyBy(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### groupBy(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### merge(target, ...)
#### desc : 
#### params : 
- target : 
- ... : 
#### return : 
--------
### values(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### keys(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### pick(source, keys)
#### desc : 
#### params : 
- source : 
- keys : 
#### return : 
--------
### entries(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### find(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### findKey(source, handler)
#### desc : 
#### params : 
- source : 
- handler : 
#### return : 
--------
### includes(source, item)
#### desc : 
#### params : 
- source : 
- item : 
#### return : 
--------
### keyOf(source, value)
#### desc : 
#### params : 
- source : 
- value : 
#### return : 
--------
### insertMany(target, items)
#### desc : 
#### params : 
- target : 
- items : 
#### return : 
--------
### getLength(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### assign(target, ...)
#### desc : 
#### params : 
- target : 
- ... : 
#### return : 
--------
### defaults(target, ...)
#### desc : 
#### params : 
- target : 
- ... : 
#### return : 
--------
### isSubset(a, b)
#### desc : 
#### params : 
- a : 
- b : 
#### return : 
--------
### deepEqual(a, b)
#### desc : 
#### params : 
- a : 
- b : 
#### return : 
--------
### shallowEqual(a, b)
#### desc : 
#### params : 
- a : 
- b : 
#### return : 
--------
### append(...)
#### desc : 
#### params : 
- ... : 
#### return : 
--------
### pop(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### push(source, ...)
#### desc : 
#### params : 
- source : 
- ... : 
#### return : 
--------
### shift(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### unshift(source, ...)
#### desc : 
#### params : 
- source : 
- ... : 
#### return : 
--------
### indexOf(source, value, from)
#### desc : 
#### params : 
- source : 
- value : 
- from : 
#### return : 
--------
### uniq(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### seal(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### readonly(source)
#### desc : 
#### params : 
- source : 
#### return : 
--------
### dump(source, depth, indent)
#### desc : 
dump **source** table to string with limited **depth**(default is 32) and **indent**(default is 4) space
#### params : 
- source : source table
- depth : limited depth
- indent : indent space
#### return : 
dump string of **source** table

--------
### clone(source, shallow)
#### desc : 
#### params : 
- source : 
- shallow : 
#### return : 
--------
### checkEqual(a, b, ignore_mt)
#### desc : 
#### params : 
- a : 
- b : 
- ignore_mt : 
#### return : 
--------
### orderPairs(source, sort_comp)
#### desc : 
#### params : 
- source : 
- sort_comp : 
#### return : 
--------
--------
> **string utils**
--------
### trim(str)
#### desc : 
#### params : 
- str : 
#### return : 
--------
### trimLeft(str)
#### desc : 
#### params : 
- str : 
#### return : 
--------
### trimRight(str)
#### desc : 
#### params : 
- str : 
#### return : 
--------
### startsWith(str, start)
#### desc : 
#### params : 
- str : 
- start : 
#### return : 
--------
### endsWith(str, ending)
#### desc : 
#### params : 
- str : 
- ending : 
#### return : 
--------
### leftPad(str, length, character)
#### desc : 
#### params : 
- str : 
- length : 
- character : 
#### return : 
--------
### rightPad(str, length, character)
#### desc : 
#### params : 
- str : 
- length : 
- character : 
#### return : 
--------
### split(str, delim)
#### desc : 
#### params : 
- str : 
- delim : 
#### return : 
--------
### formatParam(str, ...)
#### desc : 
#### params : 
- str : 
- ... : 
#### return : 
--------
--------
> **math utils**
--------
### clamp(num, low, high)
#### desc : 
clamp **num** to range [**low**, **high**], **low** should <= **high**
#### params : 
- num : target num
- low : left range
- high : right range
#### return : 

clamped num

--------
### clamp01(num)
#### desc : 
clamp **num** to range [**0**, **1**]
#### params : 
- num : target num
#### return : 
clamped num

--------
### inRange(num, low, high)
#### desc : 
#### params : 
- num : 
- low : 
- high : 
#### return : 
--------
### inRange01(num)
#### desc : 
#### params : 
- num : 
#### return : 
--------
### round(num)
#### desc : 
#### params : 
- num : 
#### return : 
--------

## usage(TODO)

```
local tu = require("utils.table_utils")
print(tu.dump({ 1, 2, 3, key = "value" }))

-- output :
--[[
{
    [1] = 1
    [2] = 2
    [3] = 3
    ["key"] = "value"
}
--]]
```

## NOTE

util function implementations are depend on base library funcs of Lua(pairs etc.)

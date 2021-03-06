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
make **source** table *sealed*(you can't add elements of source table after setting, pay attention that use **rawset** can break sealed table)
#### params : 
- source : source table
#### return : 
return sealed table

--------
### readonly(source)
#### desc : 
make **source** table *readonly*(you can't set or add elements of source table after setting, pay attention that use **rawset** can break readonly table)
#### params : 
- source : source table
#### return : 
return readonly table

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
clone **source** table, default is deep clone(**shallow** is false)
#### params : 
- source : source table
- shallow : shallow clone or not
#### return : 
return cloned table

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
trim left and right space characters of **str**
#### params : 
- str : target string
#### return : 
return trimmed string(**str** is not changed)

--------
### trimLeft(str)
#### desc : 
trim left space characters of **str**
#### params : 
- str : target string
#### return : 
return trimmed string(**str** is not changed)

--------
### trimRight(str)
#### desc : 
trim right space characters of **str**
#### params : 
- str : target string
#### return : 
return trimmed string(**str** is not changed)

--------
### startsWith(str, start)
#### desc : 
check **str** has **start** prefix
#### params : 
- str : target string
- start : target prefix
#### return : 
return **true** when **str** has **start** prefix, otherwise return **false**

--------
### endsWith(str, ending)
#### desc : 
check **str** has **start** postfix
#### params : 
- str : target string
- ending : target postfix
#### return : 
return **true** when **str** has **start** postfix, otherwise return **false**

--------
### leftPad(str, length, character)
#### desc : 
left pad **str** with **character**(default is ' ') to target **length**(total string length including padding characters)
#### params : 
- str : target string
- length : target length
- character : padding character
#### return :
return padding string(**str** is not changed)

--------
### rightPad(str, length, character)
#### desc : 
right pad **str** with **character**(default is ' ') to target **length**(total string length including padding characters)
#### params : 
- str : target string
- length : target length
- character : padding character
#### return : 
return padding string(**str** is not changed)

--------
### split(str, delim)
#### desc : 
split **str** with **delim** characters
#### params : 
- str : target string
- delim : delimiter characters
#### return : 
return a table contains splitted strings

--------
### formatParam(str, ...)
#### desc : 
format string with param identifier, e.g. formatParam("test {1} string", "format") will return "test format string"
#### params : 
- str : format string
- ... : varargs
#### return : 
return format result string

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
check **num** is in range [**low**, **high**], **low** should <= **high**

#### params : 
- num : target num
- low : left range
- high : right range
#### return : 
return **true** when **num** is in range [**low**, **high**], otherwise return **false**

--------
### inRange01(num)
#### desc : 
check **num** is in range [**0**, **1**]
#### params : 
- num : target num
#### return : 
return **true** when **num** is in range [**0**, **1**], otherwise return **false**

--------
### round(num)
#### desc : 
round **num** to closet integer
#### params : 
- num : target num
#### return : 
return integer closet to **num**

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

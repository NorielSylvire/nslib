--[[
Noriel_Sylvire's library. Version 0.1.
This library implements functions used in most of my other Minetest mods.

Copyright (C) 2022 Noriel_Sylvire.

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

Contact Noriel_Sylvire via private message on the Minetest Forum:
https://forum.minetest.net/memberlist.php?mode=viewprofile&u=24116
or any of my social media attached to my Minetest Forum profile,
such as GitHub: https://github.com/NorielSylvire
--]]

local P = {}

---@diagnostic disable: lowercase-global
nslib = P
--String utilities

function P.first_to_upper(str)
    return (str:gsub("^%l", string.upper))
end

--Logical utilities

--[[
This is an implementation of the ternary function (a.k.a. inline if) because my 3 IQ brain can't understand the syntax of the regular LUA way (YET)
To use it, simply give it a boolean cond parameter, and if it evaluates to true, it will return the T parameter, otherwise it'll return the F parameter.

Here's an example:

my_age = 17
print(nslib.tern(my_age>=18, "You are over 18 years old", "You are underage"))

This will return print "You are underage", while:

my_age = 36
print(nslib.tern(my_age>=18, "You are over 18 years old", "You are underage"))

will print "You are over 18 years old"
--]]

function P.tern(cond, T, F)
	if cond then return T else return F end
end

--[[
Inclusive clamp. If value is within a range, return the value, otherwise return the max or the min.
--]]
function P.clamp(value, min, max)
	if value == nil then return nil end
	if value <= min then return min end
	if value >= max then return max end
	return value
end

--[[
Exclusive clamp. If value is within a range but excluding the bounds, return the value, otherwise return the max or the min.
--]]
function P.eclamp(value, min, max)
	if value == nil then return nil end
	if value < min then return min end
	if value > max then return max end
	return value
end

--[[
Max exclusive clamp. If value is within a range but excluding the max, return the value, otherwise return the max or the min.
--]]
function P.maxeclamp(value, min, max)
	if value == nil then return nil end
	if value <= min then return min end
	if value > max then return max end
	return value
end

--[[
Min exclusive clamp. If value is within a range but excluding the min, return the value, otherwise return the max or the min.
--]]
function P.mineclamp(value, min, max)
	if value == nil then return nil end
	if value <= min then return min end
	if value > max then return max end
	return value
end

return nslib


back = {}

back.mod_name = minetest.get_current_modname()
back.mod_path = minetest.get_modpath(back.mod_name)

local mod_name = back.mod_name
local mod_path = back.mod_path

local loadmodule = function(path)
	local file = io.open(path)
	if not file then
		minetest.log("error","["..mod_name.."] Impossible de charger "..path)
		return false
	end
	file:close()
	return dofile(path)
end

loadmodule(mod_path .. "/functions.lua")
loadmodule(mod_path .. "/register.lua")

minetest.log("action","["..mod_name.."] mod actif")


back = {}

-- ---------------------------------------------------------------------------------------------------------------------
-- Localisation : Chargement du mod intllib si celui-ci est present
-- ---------------------------------------------------------------------------------------------------------------------
local S
if minetest.get_modpath("intllib") then
    S = intllib.Getter()
else
    S = function(s) return s end
end

back.intllib = S

-- ---------------------------------------------------------------------------------------------------------------------
-- Init du mod
-- ---------------------------------------------------------------------------------------------------------------------
back.mod_name = minetest.get_current_modname()
back.mod_path = minetest.get_modpath(back.mod_name)

local mod_name = back.mod_name
local mod_path = back.mod_path

local loadmodule = function(path)
	local file = io.open(path)
	if not file then
		minetest.log("error",S("[Back] Could not load mod"))
		return false
	end
	file:close()
	return dofile(path)
end

loadmodule(mod_path .. "/functions.lua")
loadmodule(mod_path .. "/register.lua")

minetest.log("action",S("[Back] Mod loaded"))

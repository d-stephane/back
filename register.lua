
-- register privileges

-- minetest.register_privilege("back","Peut utiliser la commande /back")

-- chatcommands

local S = back.intllib

minetest.register_chatcommand("back", {
	description = S("Back to the last known position"),
	-- privs = {back = true},
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, S("Player not found")
		end
		back.back(name)
	end,
})

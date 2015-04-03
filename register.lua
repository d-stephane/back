
-- register privileges

-- minetest.register_privilege("back","Peut utiliser la commande /back")

-- chatcommands

minetest.register_chatcommand("back", {
	description = "Retour vers la derniere position connue",
	-- privs = {back = true},
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Joueur inexistant"
		end
		back.back(name)
	end,
})

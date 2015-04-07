
-- back functions

local position = {}
position.position_file = {["f"] = minetest.get_worldpath() .. "/back_positions"}
position.position_back = {}


-- ---------------------------------------------------------------------------------------------------------------------
-- Teleportation a la derniere position connue
-- ---------------------------------------------------------------------------------------------------------------------
back.back = function(name)
    minetest.chat_send_player(name, "Retour a votre position precedente")

    local player = minetest.get_player_by_name(name)
    if player == nil then
        return false
    end

    -- Verif si position presente pour le joueur
    if position.position_back[name] then
    else
        minetest.chat_send_player(name, "Pas de position sauvegardee...")
        return false
    end

    -- Sauvegarde de la derniere position connue avant modif du fichier "back_positions"
    local p = position.position_back[player:get_player_name()]

    -- Sauvegarde de la position courante avant retour
    back.save_position(name)

    -- Tp vers position "p"
    player:setpos(p)
    return true
end


-- ---------------------------------------------------------------------------------------------------------------------
-- Sauvegarde de la position courante
-- ---------------------------------------------------------------------------------------------------------------------
function back.save_position(name)
    local player = minetest.get_player_by_name(name)
    -- minetest.chat_send_player(name, "Mod back : Position sauvegardee")

    local player = minetest.get_player_by_name(name)
    local pos = player:getpos()
    minetest.log("action","[back] Sauvegarde de la position courante -> "..minetest.serialize(pos))

    if position.position_back[player:get_player_name()] ~= pos then
        position.position_back[player:get_player_name()] = pos
        local output = io.open(position.position_file["f"], "w")
        output:write(minetest.serialize(position.position_back))
        io.close(output)
        return true
    else
        return false
    end
end


-- ---------------------------------------------------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------------------------------------------------
local function reload_positions()
    for key,_ in pairs(position.position_file) do
        local input = io.open(position.position_file[key], "r")
        if input then
            local line = input:read()
            input:seek("set",0)
            if line == nil then return end
            if not line:match("return {") then
                repeat
                    local x = input:read("*n")
                    if x == nil then
                        break
                    end
                    local y = input:read("*n")
                    local z = input:read("*n")
                    local name = input:read("*l")
                    position.position_back[name:sub(2)] = {x = x, y = y, z = z}
                until input:read(0) == nil
            else
                position.position_back = minetest.deserialize(input:read())
            end
            io.close(input)
        else
            position.position_back = {}
        end
    end
end


-- ---------------------------------------------------------------------------------------------------------------------

reload_positions()

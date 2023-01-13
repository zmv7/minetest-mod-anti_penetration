core.register_on_protection_violation(function(pos, name)
    local player = core.get_player_by_name(name)
    if not player then return end
    local yaw = player:get_look_horizontal()
    local dir = player:get_look_dir()
    local hp = player:get_hp()
    player:set_look_horizontal(yaw+math.pi)
    player:add_velocity({x=-dir.x*2,y=-dir.y*2,z=-dir.z*2})
    if hp > 0 and core.settings:get_bool("enable_damage") then
        core.after(0.1,function()
            player:set_hp(hp-1)
        end)
    end
end)
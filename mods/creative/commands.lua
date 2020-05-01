
minetest.register_on_newplayer(function(player)
  player:get_meta():set_int('creative_radius', 6)
end)

minetest.register_chatcommand('radius', {
  description = [[A command used for changing the radius with tools]],

  func = function(name, params)
    local player = minetest.get_player_by_name(name)
    local radius = tonumber(params)

    if not radius then return false, 'radius not provided' end

    player:get_meta():set_int('creative_radius', math.floor(radius))

    return true, 'radius changed'
  end
})

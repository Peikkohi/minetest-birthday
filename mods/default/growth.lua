
minetest.register_abm({
  label = 'grass growth',
  nodenames = {'default:dirt'},
  neighbors = {'default:grass'},
  interval = 5,
  chance = 10,
  action = function(pos)
    local light = minetest.get_node_light({x=pos.x, y=pos.y +1, z=pos.z}, 0.5)

    if light and light > 6 then
      minetest.set_node(pos, {name = 'default:grass'})
    end
  end
})

minetest.register_abm({
  label = 'grass deminishing',
  nodenames = {'default:grass'},
  interval = 5,
  chance = 10,
  action = function(pos)
    local light = minetest.get_node_light({x=pos.x, y=pos.y +1, z=pos.z}, 0.5)

    if not light or light <= 6 then
      minetest.set_node(pos, {name = 'default:dirt'})
    end
  end
})

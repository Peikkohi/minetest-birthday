minetest.register_alias('mapgen_singlenode', 'default:stone')
minetest.register_alias('mapgen_stone', 'default:stone')

minetest.register_biome({
  name = 'plain',

  node_top = 'default:grass',
  depth_top = 1,

  node_filler = 'default:dirt',
  depth_filler = 3,

  node_stone = 'default:stone',

  node_dungeon = 'default:cobble',

  y_max = 10,
  y_min = -31000,

  vertical_blend = 8
})

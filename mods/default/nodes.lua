minetest.register_node('default:stone', {
  description = 'Smooth stone',

  tiles = {'stone.png'},
})

minetest.register_node('default:stone_bricks', {
  description = 'Stone bricks',

  tiles = {'stone_bricks.png'}
})

minetest.register_node('default:cobble', {
  description = 'Cobblestone',

  tiles = {'cobblestone.png'}
})

minetest.register_node('default:cobble_slab', {
  description = 'Cobblestone slab',

  tiles = {'cobblestone.png'},

  drawtype = 'nodebox',
  paramtype = 'light',
  node_box = {
    type = 'fixed',
    fixed = {
      {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
    }
  },
})

minetest.register_node('default:grass', {
  description = 'Dirt\nGrass has grown onto it',

  tiles = {'grass_block_top.png', 'dirt.png', 'grass_block.png'},
})

minetest.register_node('default:dirt', {
  description = 'Dirt',

  tiles = {'dirt.png'}
})

minetest.register_node('default:bricks', {
  description = 'Bricks',

  tiles = {'bricks.png'}
})

minetest.register_node('default:bricks', {
  description = 'Bricks',

  tiles = {'bricks.png'}
})

minetest.register_node('default:nougat_bricks', {
  description = 'Nougat bricks',

  tiles = {'nougat_bricks.png'}
})

minetest.register_node('default:planks', {
  description = 'Wooden planks',

  tiles = {'planks.png'}
})

minetest.register_node('default:sand', {
  description = 'Sand',

  tiles = {'sand.png'}
})

minetest.register_node('default:tile', {
  description = 'Tile',

  tiles = {'tile.png'}
})

minetest.register_node('default:window', {
  description = 'Window',

  tiles = {'window.png'},

  drawtype = "glasslike",
  paramtype = "light",
  is_ground_content = false,
  sunlight_propagates = true,
})

minetest.register_node('default:woodlog', {
  description = 'window'
})

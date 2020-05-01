local color_nodes = {
  'black', 'blue', 'brown', 'gray', 'green',
  'light_blue', 'light_grey', 'lime', 'magenta',
  'orange', 'pink', 'purple', 'red', 'teal',
  'white', 'yellow'
}

for i,name in ipairs(color_nodes) do
  minetest.register_node('decoration:'.. name ..'_node', {
    description = name,

    tiles = {name ..'_block.png'}
  })
end

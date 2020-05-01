local abc_nodes = {
  'a','b','c','d','e','f','g','h','i','j','k',
  'l','m','n','o','p','q','r','t','u','v','w',
  'x','y','z','ao','ae','oe','exclamation','question',
  'clubs','diamond','hearts','spade'
}

for i,name in ipairs(abc_nodes) do
  minetest.register_node('decoration:'.. name ..'_node', {
    description = string.upper(name),

    tiles = {name ..'_block.png'}
  })
end

local node

local function swipe(itemstack, player, pointed)
  if pointed.type ~= 'node'
  or not player:is_player()
  or not node then return end

  local radius = player:get_meta():get_int('creative_radius')

  local pattern = creative.newPattern(radius)
  for i,dpos in ipairs(pattern) do
    local pos = vector.add(pointed.under, dpos)

    if not creative.air(pos) then
      if creative.air(creative.px(pos)) or creative.air(creative.nx(pos))
      or creative.air(creative.py(pos)) or creative.air(creative.ny(pos))
      or creative.air(creative.pz(pos)) or creative.air(creative.nz(pos)) then
        minetest.set_node(pos, node)
      end
    end
  end
end

local function color(itemstack, player, pointed)
  node = minetest.get_node(pointed.under)
end

minetest.register_tool('creative:worldbrush', {
  description = [[World brush]],

  inventory_image = 'world_brush.png',

  on_use = swipe,
  on_place = color,

  range = 100,
})

local function punch(itemstack, player, pointed)
  if pointed.type == 'node' then
    minetest.remove_node(pointed.under)
  end
end

local function hole(itemstack, player, pointed)
  if not player:is_player() then return end

  local radius = player:get_meta():get_int('creative_radius')

  local pattern = creative.newPattern(radius)
  for i,dpos in ipairs(pattern) do
    local pos = vector.add(pointed.under, dpos)

    minetest.remove_node(pos)
  end
end

minetest.register_tool('creative:drill', {
  description = 'Drill',
  inventory_image = 'drill.png',
  range = 10,

  on_use = punch,
  on_place = hole
})

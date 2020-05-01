
local function pull(itemstack, player, pointed)
  local pos = pointed.under
  local radius = player:get_meta():get_int('creative_radius')

  local pattern = creative.new2dPattern(radius)
  for i,dpos in ipairs(pattern) do
    local this = {}

    this.x = pos.x + dpos.x
    this.y = pos.y
    this.z = pos.z + dpos.z

    if creative.air(this) then
      while creative.air(creative.ny(this)) do
        this.y = this.y - 1
      end
    else
      --repeat
        this.y = this.y + 1
      --until creative.air(this)
    end

    local node = minetest.get_node(creative.ny(this))

    if node.name ~= 'ignore' then
      minetest.set_node(this, node)
    end
  end
end

local function push(itemstack, player, pointed)
  local pos = pointed.under
  local radius = player:get_meta():get_int('creative_radius')

  local pattern = creative.new2dPattern(radius)
  for i,dpos in ipairs(pattern) do
    local this = {}

    this.x = pos.x + dpos.x
    this.y = pos.y
    this.z = pos.z + dpos.z

    if not creative.air(this) then
      while not creative.air(creative.py(this)) do
        this.y = this.y + 1
      end
    --[[else
      repeat
        this.y = this.y - 1
      until not creative.air(this)]]
    end

    minetest.remove_node(this)
  end
end

minetest.register_tool('creative:terrain_sceptre', {
  description = [[Terrain sceptre]],

  inventory_image = 'terrain_sceptre.png',
  range = 100,

  on_use = pull,
  on_place = push
})

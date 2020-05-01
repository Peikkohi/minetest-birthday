creative = {}

local t = {'p','n'}
local c = {'x','y','z'}

for i,t in ipairs(t) do
  for j,c in ipairs(c) do
    creative[t .. c] = function(pos)
      local apos = {}

      apos.x = pos.x + (c == 'x' and (t == 'p' and 1 or -1) or 0)
      apos.y = pos.y + (c == 'y' and (t == 'p' and 1 or -1) or 0)
      apos.z = pos.z + (c == 'z' and (t == 'p' and 1 or -1) or 0)

      return apos
    end
  end
end

function creative.air(pos)
  local node = minetest.get_node(pos)

  return node.name == 'air'
end

function creative.newPattern(radius)
  local pattern = {}

  for x = 0, 2 * radius do
    for y = 0, 2 * radius do
      for z = 0, 2 * radius do
        local pos = {}

        pos.x = x - radius
        pos.y = y - radius
        pos.z = z - radius

        if pos.x^2 + pos.y^2 + pos.z^2 - 1 <= radius^2 then
          table.insert(pattern, pos)
        end
      end
    end
  end

  return pattern
end

function creative.new2dPattern(radius)
  local pattern = {}

  for x = 0, 2 * radius do
    for z = 0, 2 * radius do
      local pos = {}

      pos.x = x - radius
      pos.z = z - radius

      if pos.x^2 + pos.z^2 - 1 <= radius^2 then
        table.insert(pattern, pos)
      end
    end
  end

  return pattern
end

minetest.register_on_newplayer(function(player)
  player:get_meta():set_int('creative_radius', 6)
end)

minetest.register_chatcommand('radius', {
  description = [[A command used for changing the radius with tools]],

  func = function(name, params)
    local player = minetest.get_player_by_name(name)
    local radius = math.floor(tonumber(params))

    player:get_meta():set_int('creative_radius', radius)
  end
})

local modpath = minetest.get_modpath('creative')

dofile(modpath .. DIR_DELIM ..'drill.lua')
dofile(modpath .. DIR_DELIM ..'sceptre.lua')
dofile(modpath .. DIR_DELIM ..'worldbrush.lua')

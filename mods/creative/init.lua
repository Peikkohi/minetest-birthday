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

  return node.name == 'air' or node.name == 'ignore'
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

local modpath = minetest.get_modpath('creative')

dofile(modpath .. DIR_DELIM ..'drill.lua')
dofile(modpath .. DIR_DELIM ..'sceptre.lua')
dofile(modpath .. DIR_DELIM ..'worldbrush.lua')
dofile(modpath .. DIR_DELIM ..'commands.lua')

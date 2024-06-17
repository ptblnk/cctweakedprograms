FLAG = true
LENGTH = 18
WIDTH = 18

local function cropHandling()
local downSuccess, downData = turtle.inspectDown()
if downSuccess then
 if downData.state.age == 3 then
  turtle.digDown()
 end
end
end

local function fuelHandling()
 local has_block, data = turtle.inspect()
 if has_block then
  if data.name == "computercraft:wired_modem_full" then
  local modem = peripheral.wrap("front")
  local turtleName = modem.getNameLocal()
  local chest = peripheral.find("coxinhautilities:wooden_hopper")
   if turtle.getFuelLevel() < 1600 then
   chest.pushItems(turtleName, 1, 1, 16)
   turtle.select(16)
   turtle.refuel()
   end
  end
 end
end


local turns = 0
local rotations = 0
while FLAG do
if turns == LENGTH-1 then
 for i = 1,LENGTH-2 do
  cropHandling()
  print("l-movement:", i)
  assert(turtle.forward())
 end
 assert(turtle.turnLeft())
 for i = 1,WIDTH-1 do
  print("w-movement:", i) 
  assert(turtle.forward())
 end
 fuelHandling()
 assert(turtle.turnLeft())
 turns = 0
 rotations = 0
else
 if turtle.detect() then
  if rotations == 0 then
   cropHandling()
   assert(turtle.turnLeft())
   assert(turtle.forward())
   assert(turtle.turnLeft())
   rotations = rotations + 1
   turns = turns + 1
  elseif rotations == 1 then
   cropHandling()
   assert(turtle.turnRight())
   assert(turtle.forward())
   assert(turtle.turnRight())
   rotations = rotations - 1
   turns = turns + 1
  end
 end
end

cropHandling()
assert(turtle.forward())
end

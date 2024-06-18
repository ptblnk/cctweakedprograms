FLAG = true
LENGTH = 18
WIDTH = 18
 
local function cropHandling()
local frontSuccess, frontData = turtle.inspect()
local downSuccess, downData = turtle.inspectDown()
if frontSuccess then
 if frontData.name == "minecraft:bamboo" then
  turtle.dig()
  turtle.dig()
 end
end
 
if downSuccess then
 if downData.state.age == 3 then
  turtle.digDown()
 end
end
assert(turtle.forward())
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
 end
 assert(turtle.turnLeft())
 for i = 1, WIDTH-1 do
  cropHandling()
 end
 fuelHandling()
 assert(turtle.turnLeft())
 for i = 1, 16 do
  turtle.select(i)
  turtle.drop()
 end
 turns = 0
 rotations = 0
else
 local has_block, data = turtle.inspect()
  if has_block then
   if data.name ~= "minecraft:bamboo" then
    if rotations == 0 then
     assert(turtle.turnLeft())
     cropHandling()
     assert(turtle.turnLeft())
     rotations = rotations + 1
     turns = turns + 1
    elseif rotations == 1 then
     assert(turtle.turnRight())
     cropHandling()
     assert(turtle.turnRight())
     rotations = rotations - 1
     turns = turns + 1
    end
  end  
 end
end
cropHandling()
end
 
 

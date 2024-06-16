LENGTH = 17
FLAG = true

local function itemHandling()
if turtle.getItemCount() == 0 then
 if turtle.getSelectedSlot() == 16 then
 turtle.select(1)
 end
 turtle.select(turtle.getSelectedSlot() + 1)
end
end

local height = 0
local function countUp()
turtle.up()
 if height == 1 then

 else
  height = height + 1
 end
end

local function countDown()
turtle.down()
 if height == 0 then

 else
 height = height - 1
 end
end


local function storageHandling()
local storage = "minecraft:barrel"
local has_block, data = turtle.inspect()
if has_block then
 if data.name == "computercraft:wired_modem_full" then
 local modem = peripheral.wrap("front")
 local turtleName = modem.getNameLocal()
 local chest = peripheral.find(storage)
 turtle.select(1)
 for x = 1, 1 do
  for i = 1, 15 do
   turtle.select(i)
   chest.pushItems(turtleName, x, 64, i)
  end
 end
 turtle.select(1)
end
end
end

local function fuelHandling()
local storage = "coxinhautilities:wooden_hopper"
local has_block, data = turtle.inspect()
 if has_block then
  if data.name == "computercraft:wired_modem_full" then
   local modem = peripheral.wrap("right")
   local turtleName = modem.getNameLocal()
   local chest = peripheral.find(storage)
   if turtle.getFuelLevel() < 1600 then
    chest.pushItems(turtleName, 1, 1, 16)
    turtle.select(16)
    turtle.refuel()
   end
  end
 end
end

local function cropHandling()
local downSuccess, downData = turtle.inspectDown()
if downSuccess then
 if downData.state.age == 7 then
  turtle.digDown()
  turtle.digDown()
  countDown()
  itemHandling()
  turtle.placeDown()
 end
end
if not downSuccess then
 itemHandling()
 turtle.placeDown()
 countDown()
 turtle.placeDown()
  if select(2, turtle.inspectDown()).name == "minecraft:water" then
   countUp()
 end
end

if select(2, turtle.inspect()).name == "supplementaries:flax" then
 countUp()
end
end

local turns = 0
local rotations = 0
local function turnHandling()
local has_block, data = turtle.inspect()
 if has_block then
 if data.name ~= "supplementaries:flax" then
  cropHandling()
  if height == 0 and turns == 0 then
   countUp()
   storageHandling()
  end
  if rotations == 0 then
   assert(turtle.turnLeft())
   if height == 0 and turtle.detect() then
    countUp()
   end
   assert(turtle.forward())
   assert(turtle.turnLeft())
   rotations = rotations + 1
   turns = turns + 1
  elseif rotations == 1 then
   assert(turtle.turnRight())
   if height == 0 and turtle.detect() then
    countUp()
   end
   assert(turtle.forward())
   assert(turtle.turnRight())
   rotations = rotations - 1
   turns = turns + 1
  end
 end
end
end

while FLAG do
if turns == LENGTH then
 for i = 1,LENGTH do
  if i < LENGTH then
   cropHandling()
   assert(turtle.forward())
  else
   cropHandling()
   countUp()
  end
 end
 assert(turtle.turnLeft())
 assert(shell.execute("go", "forward", "17"))
 assert(turtle.turnLeft())
 fuelHandling()
else
 turnHandling()
cropHandling()
assert(turtle.forward())
end
end

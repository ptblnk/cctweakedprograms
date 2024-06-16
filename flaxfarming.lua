local function itemHandling()
if turtle.getItemSpace() == 0 then
 if turtle.getSelectedSlot() == 16 then
 turtle.select(1)
 else
 turtle.select(turtle.getSelectedSlot() + 1)
  end
end
end

local height = 0
local function countUp()
assert(turtle.up())
 if height == 1 then

 else
  height = height + 1
end
end

local function countDown()
assert(turtle.down())
  if height == 0 then

  else
   height = height - 1
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
  if select(2, turtle.inspectDown()).name == "minecraft:water" then

  else
  itemHandling()
  turtle.placeDown()
  countDown()
 end
end

if select(2, turtle.inspect()).name == "supplementaries:flax" then
  countUp()
end
end

local function storageHandling()
local storage = "minecraft:barrel"
 local has_block, data = turtle.inspect()
 if has_block then
  if data.name == storage then
  local modem = peripheral.wrap("back")
  local turtleName = modem.getNameLocal()
  local chest = peripheral.find(storage)
   for i = 1, 16 do
    turtle.select(i)
    if turtle.getItemDetail(i, false) == nil then
     chest.pushItems(turtleName, i, 64, i)
    end
   end
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
   if turtle.getFuelLevel() < 800 then
   chest.pushItems(turtleName, 1, 1, 16)
   turtle.select(16)
   turtle.refuel()
   end
  end
 end
end

local function startUp()
turtle.digDown()
turtle.digDown()
countDown()
itemHandling()
turtle.placeDown()
end

startUp()

local length = 17
local turns = 0
local rotations = 0
FLAG = true
while FLAG do
if turns == 17 then
 for i = 1,length-1 do
  cropHandling()
  assert(turtle.forward())
 end
 assert(turtle.turnLeft())
 assert(shell.execute("go", "forward", "17"))
 fuelHandling()
 storageHandling()
 assert(turtle.turnLeft())
else
 local has_block, data = turtle.inspect()
 if has_block then
 if data.name ~= "supplementaries:flax" then
  if rotations == 0 then
   cropHandling()
   assert(turtle.turnLeft())
   if height == 0 then
    countUp()
   end
   assert(turtle.forward())
   assert(turtle.turnLeft())
   rotations = rotations + 1
   turns = turns + 1
  elseif rotations == 1 then
   cropHandling()
   assert(turtle.turnRight())
   if height == 0 then
    countUp()
   end
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
end

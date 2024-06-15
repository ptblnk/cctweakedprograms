local function itemHandling()
if turtle.getItemSpace() == 0 then
 if turtle.getSelectedSlot() == 16 then
 turtle.select(1)
 else
 turtle.select(turtle.getSelectedSlot() + 1)
  end
end
end

local function cropHandling()
local downSuccess, downData = turtle.inspectDown()
local frontSuccess, frontData = turtle.inspect()
if downSuccess then
 if downData.state.age == 7 then
  turtle.select(1)
  turtle.digDown()
  turtle.digDown()
  assert(turtle.down())
  itemHandling()
  turtle.placeDown()
 end
end

if not downSuccess then
 assert(turtle.down())
 if not turtle.detectDown() then
  itemHandling()
  turtle.placeDown()
 end
end

if frontSuccess then
 if frontData.name == "supplementaries:flax" then
  assert(turtle.up())
 end
end
end


local function storageHandling()
local storage = "minecraft:barrel"
 local has_block, data = turtle.inspect()
 if has_block then
  if data.name == storage then
  local modem = peripheral.wrap("front")
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

T = 1
local turns = 0
local rotations = 0
while (T>0) do
if turns == 18 then
 assert(turtle.turnLeft())
 assert(shell.execute("go", "forward", "17"))
 fuelHandling()
 assert(turtle.turnLeft())
else
 if turtle.detect() then
  storageHandling()
  if rotations == 0 then
   assert(turtle.turnLeft())
   assert(turtle.forward())
   assert(turtle.turnLeft())
   rotations = rotations + 1
   turns = turns + 1
  elseif rotations == 1 then
   assert(turtle.turnRight())
   assert(turtle.forward())
   assert(turtle.turnRight())
   rotations = rotations - 1
   turns = turns + 1
  end
 end
end

itemHandling()
cropHandling()
assert(turtle.forward())
end

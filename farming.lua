local function cropHandling()
 local success, data = turtle.inspectDown()
 if success then
  if data.state.age == 3 then
   assert(turtle.digDown())
   assert(turtle.placeDown())
   assert(turtle.suckDown())
  else

  end
 end
end

local function fuelHandling()
 if turtle.getFuelLevel() < 100 then
 assert(turtle.refuel())
 end
end

local function chestHandling()
 local has_block, data = turtle.inspect()
 if has_block then
  if data.name == "minecraft:chest" then
   for i =  2, 16 do
    assert(turtle.drop())
   end
  end
 end
end

local function fuelStorageHandling()
 local has_block, data = turtle.inspect()
 if has_block then
  if data.name == "computercraft:wired_modem_full" then
  local modem = peripheral.wrap("front")
  local turtleName = modem.getNameLocal()
  local chest = peripheral.find("chest")
  assert(chest.pushItems(turtleName, 1, 1))
  end
 end
end
    
LENGTH = 17
T = 1

while (T>0) do
  local mLength = LENGTH
  for x = 1, 2 do
    for i = 1, mLength do
      cropHandling()
      fuelHandling()
      chestHandling()
      fuelStorageHandling()
      assert(turtle.forward())
    end
  assert(turtle.turnLeft())
  mLength = mLength - 1
  end
end
 


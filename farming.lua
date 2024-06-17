FLAG = true
LENGTH = 17

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
  local modem = peripheral.wrap("right")
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
else
if turns == 17 then
 for i = 1,LENGTH-1 do
  cropHandling()
  assert(turtle.forward())
 end
 assert(turtle.turnLeft())
 assert(shell.execute("go", "forward", "17"))
 assert(turtle.turnLeft())
 fuelHandling()
end
end
cropHandling()
assert(turtle.forward())
end

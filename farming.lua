local function cropHandling()
 local success, data = turtle.inspectDown()
 if success then
  if data.state.age == 3 then
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
  local chest = peripheral.find("minecraft:chest")
   if turtle.getFuelLevel() < 800 then
   chest.pushItems(turtleName, 1, 1, 16)
   turtle.select(16)
   turtle.refuel()
   end
  end
 end
end
              
T = 1

local length = 17
local moves = length
while (T>0) do
if length == 0 then
 assert(shell.execute("go", "forward", "9"))
 fuelHandling()
 assert(turtle.turnLeft())
 assert(shell.execute("go", "forward", "8"))
 assert(turtle.turnLeft())
 sleep(1)
 length = 17
 moves = length
 return
 else
 for x = 1, 3 do
  for i = 1, length do
   moves = moves - 1
   cropHandling()
   assert(turtle.forward())
   if moves == 0 then
    assert(turtle.turnLeft())
    moves = length
   end
  end
 end
end   
length = length - 1
print(length)
end
 

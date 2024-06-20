DIRECTION = "front"
RADIUS = 8

local scanner = peripheral.find("universal_scanner")
local powered = false
while true do
local data = scanner.scan("player", RADIUS)
if powered == false then 
 if data ~= nil then
  if data[1] ~= nil then
   redstone.setOutput(DIRECTION, true)
   powered = true
  end
 end
end
 
if powered == true then
 if data ~= nil then
  if data[1] == nil then 
   redstone.setOutput(DIRECTION, false)
   powered = false
  end
 end
end
end

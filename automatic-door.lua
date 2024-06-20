local scanner = peripheral.find("universal_scanner")
local powered = false
while true do
local data = scanner.scan("player", 4)
if powered == false then 
 if data ~= nil then
  if data[1] ~= nil then
   redstone.setOutput("left", true)
   powered = true
  end
 end
end
 
if powered == true then
 if data ~= nil then
  if data[1] == nil then 
   redstone.setOutput("left", false)
   powered = false
  end
 end
end
end

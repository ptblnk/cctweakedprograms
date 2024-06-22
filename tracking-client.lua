HOSTNAME = os.computerLabel() -- set label using "label set NAME"
LOCATION = vector.new(0, 0, 0) -- insert computer location here
 
peripheral.find("modem", rednet.open)

local scanner = peripheral.find("universal_scanner")
 
while true do
local msg = HOSTNAME .. "'s:\n"
local data = scanner.scan("player", 24)
if data ~= nil then
 for i = 1, #data do
  if data[i] ~= nil then
   local coords = LOCATION:add(vector.new(data[i]["x"], data[i]["y"], data[i]["z"]+1))
   msg = msg .. data[i]["displayName"] .. " | " .. tostring(coords) .. "\n"
  end
 end
 rednet.broadcast(msg, "tracking")
end
end
 

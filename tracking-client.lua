HOSTNAME = "HOST"
 
peripheral.find("modem", rednet.open)
scanner = peripheral.find("universal_scanner")
 
while true do
local msg = HOSTNAME .. "'s:\n"
local data = scanner.scan("player", 24)
if data ~= nil then
 for i = 1, #data do
  if data[i] ~= nil then
   msg = msg .. data[i]["displayName"] .. "\n"
  end
 end
 for i = 1, 5 do
 rednet.broadcast(msg, "tracking")
 end
end
end

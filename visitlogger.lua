OWNER = "" -- insert UUID

location = vector.new(0, 0, 0) -- enter computer location here
logfile = fs.open("logs.txt", "a")

local scanner = peripheral.find("universal_scanner")

while true do
local log = ""
local data = scanner.scan("player", 6)
if data ~= nil then
 for i = 1, #data do
  if data[i] ~= nil then
   if data[i]["uuid"] ~= OWNER then
    local coords = location:add(vector.new(data[i]["x"], data[i]["y"], data[i]["z"]))
    log = log .. data[i]["displayName"] .. ": " .. tostring(coords) .. "\n"
   end
  end
 end
 if log ~= "" then
  logfile.writeLine(os.date("%d.%m.%y %H:%M:%S"))
  logfile.writeLine(log)
  logfile.flush()
 end
end
sleep(1)
end
logfile.close()

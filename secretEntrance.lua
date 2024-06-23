OWNER = "USERNAME" -- set username
 
local scanner = peripheral.find("universal_scanner")
local forger = peripheral.find("reality_forger")
 
local function isPhasable()
 forger.batchForgeRealityPieces({{{{x=0,y=2,z=-3}, {x=0,y=3,z=-3}}, {block="minecraft:bookshelf"}, {playerPassable=true}}}) -- set block coords and block
end
 
local function notPhasable()
 forger.batchForgeRealityPieces({{{{x=0,y=2,z=-3}, {x=0,y=3,z=-3}}, {block="minecraft:bookshelf"}, {playerPassable=false}}}) -- set block coords and block
end
 
while true do
local data = scanner.scan("player", 2)
if data ~= nil then
 if data[1] ~= nil then
  for i=1, #data do
   if data[i]["displayName"] == OWNER and data[i]["z"] <= 0 and data[i]["x"] < 2 then
    isPhasable()
   else
    notPhasable()
   end
  end
 end
 if data[1] == nil then
  notPhasable()
 end
end
end

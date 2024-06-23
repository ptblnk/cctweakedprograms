local forger = peripheral.find("reality_forger")
 
local anchors = forger.detectAnchors()
 
for i=1, #anchors do
 print("x:", anchors[i]["x"], "y:",anchors[i]["y"], "z:", anchors[i]["z"])
end

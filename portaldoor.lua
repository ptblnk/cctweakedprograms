local monitors = { peripheral.find("monitor") }
for _, monitor in pairs(monitors) do
 monitor.setTextScale(0.5)
 monitor.setCursorPos(1,1)
 monitor.clear()
end
 
while true do
local output = ""
 for i=1, 285 do -- multiple of 15 and 57
  output = output .. math.random(0,1)
 end
 for _, monitor in pairs(monitors) do
  print(output)
  term.redirect(monitor)
 end
sleep(0.1)
end 

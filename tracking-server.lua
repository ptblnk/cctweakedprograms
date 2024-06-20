peripheral.find("modem", rednet.open)
 
local monitor = peripheral.find("monitor")
monitor.setTextScale(0.5)
 
-- init table to store messages from different IDs
local messages = {}
 
-- main loop
while true do
  -- wait for any message
  local senderId, message, protocol = rednet.receive("tracking")
 
  -- update latest message for the sender's ID
  messages[senderId] = message
 
  -- clear console
  term.clear()
  term.setCursorPos(1, 1)
 
  -- print the latest messages from each ID
  for id, msg in pairs(messages) do
    print(msg)
  end
 -- output to monitor
 term.redirect(monitor)
end
 

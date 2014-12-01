wall = Image.load("Menu/back2.png")

font = Font.load("fonts/mario.ttf")
font:setPixelSizes(20,20)

info = false

while true do
  screen:clear()
  pad = Controls.read()
  screen:blit(0,0,wall)
  screen:fontPrint(font,100,30,"Time Trial Mode is Locked !", Color.new(0,0,255))

  screen:fontPrint(font,20,75,"You've to Complete At least one ", Color.new(0,0,255))
  screen:fontPrint(font,20,95,"Cup To unlock this Event", Color.new(0,0,255))
  screen:fontPrint(font,20,135,"Or Use a Special Cheat Code ", Color.new(0,0,255))
  screen:fontPrint(font,20,155,"In this Menu", Color.new(0,0,255))
  screen:fontPrint(font,50,260,"Press Circle to Go Back", Color.new(0,0,255))

  if pad:circle() then 
    dofile("menu2.lua") 
  end

  if pad:triangle() and pad:cross() then
    info = true
    file = io.open("data/hack.spl" , "w")
    file:write("unlocked")
    file:close()
  end

  if info == true then
    screen:fontPrint(font,50,205,"Time Trial Mode Unlocked !", Color.new(0,0,255))
  end

  screen.waitVblankStart()
  screen.flip()
end


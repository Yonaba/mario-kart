System.setcpuspeed(333)

Menu2 = loadfile("menu2.lua")
Credits = loadfile("credits.lua")

if Menu2 == nil or Credits == nil then
  screen:clear()
  screen:print(10,10,"File Loading Failed",Color.new(255,0,0))
  screen:print(10,20,"Reinstall Homebrew Please",Color.new(255,0,0))
  screen.flip()
end
---------------------------------------------------------------------------------------------------------------------------------------------

function garbageMenu()
  background = nil
  font = nil
  pad = nil
  oldpad = nil
  Opt1 = nil
  Opt2 = nil
  Opt3 = nil
  x1 = nil
  x2 = nil
  x3 = nil
  cursor = nil
  cpos = nil
  z1 = nil
  collectgarbage()
end

background = Image.load("Menu/background.png")
Opt1 = "Play"
Opt2 = "Credits"
Opt3 = "Exit"

x1 = 480
x2 = 680
x3 = 880

font = Font.load("fonts/Mario.TTF")
font:setPixelSizes(20,18)

Oldpad = Controls.read()

cursor = Image.load("Sprites/Cursor.PNG")
z1 = 100
cpos = 0

while true do
  screen:clear()
  pad = Controls.read()
  screen:blit(0,0,background)

  if pad:down() and not oldpad:down() then
    cpos = cpos + 1
    z1 = z1 + 30
  end

  if pad:up() and not oldpad:up() then
    cpos = cpos - 1
    z1 = z1 - 30
  end

  if z1 >= 150 then z1 = 150 end
  if z1 <= 90 then z1 = 90 end
  if cpos >= 2 then cpos = 2 end
  if cpos <= 0 then cpos = 0 end

  x1 = x1 - 8
  x2 = x2 - 8
  x3 = x3 - 8

  if x1 <= 60 then x1 = 60 end
  if x2 <= 60 then x2 = 60 end
  if x3 <= 60 then x3 = 60 end

  if x1 == 60 and x2 == 60 and x3 == 60 then
    screen:blit(10,z1,cursor)
    screen:fontPrint(font,20,210,"Choose And Press Start", Color.new(255,255,0))

    if pad:start() and cpos== 0 then
      garbageMenu()
      Menu2()
    end

    if pad:start() and cpos==1 then
      garbageMenu()
      Credits()
    end

    if pad:start() and cpos == 2 then
      garbageMenu()
      System.Quit() 
    end  
  end

  screen:fontPrint(font,x1, 120, Opt1, Color.new(255,0,0))
  screen:fontPrint(font,x2, 150, Opt2, Color.new(255,0,0))
  screen:fontPrint(font,x3, 180, Opt3, Color.new(255,0,0))

  oldpad = pad
  screen.waitVblankStart()
  screen.flip()
end



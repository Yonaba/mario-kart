Menu = loadfile("menu.lua")

if Menu == nil then
  screen:clear()
  screen:print(10,10,"File Loading Failed",Color.new(255,0,0))
  screen:print(10,20,"Reinstall Homebrew Please",Color.new(255,0,0))
  screen.flip()
end

function garbageCredits()
  font = nil
  for a = 1,10 do
    y[a] = nil
  end
  minuteur = nil
  currentTime = nil
end
--Loading Fonts
font = Font.load("fonts/mario.ttf")
font:setPixelSizes(15,15)

y = {}
y[1] = 290
y[2] = 310
y[3] = 350
y[4] = 370
y[5] = 390
y[6] = 410
y[7] = 430
y[8] = 470
y[9] = 490
y[10] = 510

minuteur = Timer.new()
minuteur:start()

while true do
  screen:clear()
  currentTime = minuteur:time()

  screen:fontPrint(font,150,y[1],"Code",Color.new(255,0,0))
  screen:fontPrint(font,150,y[2],"SeanPaul223",Color.new(0,220,0))
  screen:fontPrint(font,150,y[3],"Graphics/Sprites",Color.new(255,0,0))
  screen:fontPrint(font,150,y[4],"JOY6679",Color.new(0,220,0))
  screen:fontPrint(font,150,y[5],"Seanpaul223",Color.new(0,220,0))
  screen:fontPrint(font,150,y[6],"Zion/Paiku",Color.new(0,220,0))
  screen:fontPrint(font,150,y[7],"The Spriters Ressources",Color.new(0,220,0))
  screen:fontPrint(font,150,y[8],"Special Thanks",Color.new(255,0,0))
  screen:fontPrint(font,150,y[9],"All PSP Boards",Color.new(0,220,0))
  screen:fontPrint(font,150,y[10],"All Devs Forums",Color.new(0,220,0))

  for a = 1,10 do
    if currentTime > 500 then
    y[a] = y[a] - 5
    end
  end

  if y[10] <= -20 then
    Menu()
  end

  screen.waitVblankStart()
  screen.flip()
end 




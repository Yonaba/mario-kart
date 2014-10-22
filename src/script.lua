Menu = loadfile("menu.lua")
if menu == nil then
	screen:clear()
	screen:print(10,10,"Menu Loading Failed",Color.new(255,0,0))
	screen:print(10,20,"Reinstall Homebrew Please",Color.new(255,0,0))
	screen.flip()
end

--first Image for fade
image = Image.load("StartGfx/1.png")
fader = Image.createEmpty(480,272)
alphaValue = 255
faderColor = Color.new(0,0,0,alphaValue)
fader:clear(faderColor)

while true do
	screen:clear()
	screen:blit(0,0,image)
	screen:blit(0,0,fader)
	if alphaValue > 0 then
		alphaValue = alphaValue - 5
	else
		break
	end
	faderColor = Color.new(0,0,0,alphaValue)
	fader:clear(faderColor)
	
	screen.waitVblankStart()
	screen.flip()
end

screen.waitVblankStart(50) 

while true do
	screen:clear()
	screen:blit(0,0,image)
	screen:blit(0,0,fader)
	if alphaValue < 255 then
		alphaValue = alphaValue + 5
	else
		break
	end
	faderColor = Color.new(0,0,0,alphaValue)
	fader:clear(faderColor)
	
	screen.waitVblankStart()
	screen.flip()
end

--Unload Image from memory and cleaning RAM
image = nil
collectgarbage()

--second Image for fade
--first Image for fade

image = Image.load("StartGfx/2.png")
fader = Image.createEmpty(480,272)
alphaValue = 255
faderColor = Color.new(0,0,0,alphaValue)
fader:clear(faderColor)

while true do
	screen:clear()
	screen:blit(0,0,image)
	screen:blit(0,0,fader)
	if alphaValue > 0 then
		alphaValue = alphaValue - 5
	else
		break
	end
	faderColor = Color.new(0,0,0,alphaValue)
	fader:clear(faderColor)
	
	screen.waitVblankStart()
	screen.flip()
end

screen.waitVblankStart(75) 

while true do
	screen:clear()
	screen:blit(0,0,image)
	screen:blit(0,0,fader)
	if alphaValue < 255 then
		alphaValue = alphaValue + 5
	else
		break
	end
	faderColor = Color.new(0,0,0,alphaValue)
	fader:clear(faderColor)
	
	screen.waitVblankStart()
	screen.flip()
end

--Unload Image from memory and cleaning RAM
image = nil
collectgarbage()

while true do
	Menu()
end

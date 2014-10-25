Credits2 = loadfile("credits2.lua")

if Credits2 == nil then
	screen:clear()
	screen:print(10,10,"File Loading Failed",Color.new(255,0,0))
	screen:print(10,20,"Reinstall Homebrew Please",Color.new(255,0,0))
	screen.flip()
end

BackGround_Cache = Image.load("credits/1.png")
fader = Image.createEmpty(480,272)
alphaValue = 255
faderColor = Color.new(0,0,0,alphaValue)
fader:clear(faderColor)

while true do
	screen:clear()
	screen:blit(0,0,BackGround_Cache)
	screen:blit(0,0,fader)
	if alphaValue > 0 then
		alphaValue = alphaValue - 10
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
	screen:blit(0,0,BackGround_Cache)
	screen:blit(0,0,fader)
	if alphaValue < 255 then
		alphaValue = alphaValue + 10
	else
		break
	end
	faderColor = Color.new(0,0,0,alphaValue)
	fader:clear(faderColor)
	
	screen.waitVblankStart()
	screen.flip()
end

BackGround_Cache = nil
fader = nil
alphaValue = nil
faderColor = nil
collectgarbage()

BackGround_Cache = Image.load("credits/2.png")
fader = Image.createEmpty(480,272)
alphaValue = 255
faderColor = Color.new(0,0,0,alphaValue)
fader:clear(faderColor)

while true do
	screen:clear()
	screen:blit(0,0,BackGround_Cache)
	screen:blit(0,0,fader)
	if alphaValue > 0 then
		alphaValue = alphaValue - 10
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
	screen:blit(0,0,BackGround_Cache)
	screen:blit(0,0,fader)
	if alphaValue < 255 then
		alphaValue = alphaValue + 10
	else
		break
	end
	faderColor = Color.new(0,0,0,alphaValue)
	fader:clear(faderColor)
	
	screen.waitVblankStart()
	screen.flip()
end

BackGround_Cache = nil
fader = nil
alphaValue = nil
faderColor = nil
collectgarbage()

while true do
	Credits2()
end

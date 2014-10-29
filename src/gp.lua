function garbageCup_Selection()
	cup1 = nil
	c2 = nil
	c3 = nil
	wall = nil
	font = nil
	cup = nil
	current_cup = nil
	collectgarbage()
end

wall = Image.load("Menu/back2.png")

--fonts
font = Font.load("fonts/mario.ttf")
font:setPixelSizes(20,20)

--Cup Images
c1 = Image.load("Sprites/Cup Selection/cup1.png")
c2 = Image.load("Sprites/Cup Selection/cup2.png")
c3 = Image.load("Sprites/Cup Selection/cup3.png")

--Tracks Images
TT = Image.load("Sprites/Tracks/Flower Cup/Toad's turnpike/TT.png")
WS = Image.load("Sprites/Tracks/Star Cup/Wario Stadium/WT.png")
KD = Image.load("Sprites/Tracks/Mushroom Cup/Kalimari Desert/KD.png")
KTB = Image.load("Sprites/Tracks/Mushroom Cup/Koopa Troopa Beach/KB.png")
MMF = Image.load("Sprites/Tracks/Mushroom Cup/Moo Moo Farm/MMF.png")
LR = Image.load("Sprites/Tracks/Mushroom Cup/Luigi Raceway/LR.png")

current_cup = 1
cup = {
img = cup1;
}
Oldpad = Controls.read()

timer = 0

while true do
	screen:clear()
	pad = Controls.read()
	screen:blit(0,0,wall)
	screen:fontPrint(font,145,20,"Select Cup", Color.new(0,0,255))

	if pad:right() and not oldpad:right() then current_cup = current_cup + 1 end
	if pad:left() and not oldpad:left() then current_cup = current_cup - 1 end

	if current_cup > 3 then current_cup = 1 end
	if current_cup < 1 then current_cup = 3 end

	if current_cup == 1 then 
		cup.img = c1 

		timer = timer + 0.1
		if timer > 0 and timer < 5 then c = LR
		elseif timer > 5 and timer < 10 then c = MMF
		elseif timer > 10 and timer < 15 then c = KTB
		elseif timer > 15 and timer < 20 then c = KD
		elseif timer > 20 then timer = 0 
		end

		if pad:cross() and oldpad:cross() ~=pad:cross() then
			file = io.open("data/cup.spl", "w")
			file:write("cup1")
			file:close()
			garbageCup_Selection()
			dofile("c_player.lua")
		end
		screen:blit(20,88,cup.img)
		screen:blit(280,120,c)
		screen:fontPrint(font,250,100,"MushRoom Cup", Color.new(255,0,0))
	end

	if current_cup == 2 then 
		cup.img = c2
		c = TT
		screen:blit(20,88,cup.img)
		screen:blit(280,120,c)
		screen:fontPrint(font,250,100,"Flower Cup", Color.new(255,0,0))
		screen:print(230,220,"This Cup is Not Yet Complete", Color.new(255,0,0))
		screen:print(230,230,"Only One Track Available", Color.new(255,0,0))
	end

	if current_cup == 3 then 
		cup.img = c3 
		c = WS
		screen:blit(20,88,cup.img)
		screen:blit(280,120,c)
		screen:fontPrint(font,250,100,"Star Cup", Color.new(255,0,0))
		screen:print(230,220,"This Cup is Not Yet Complete", Color.new(255,0,0))
		screen:print(230,230,"Only One Track Available", Color.new(255,0,0))
	end

	oldpad = pad
	
	screen.waitVblankStart()
	screen.flip()
end

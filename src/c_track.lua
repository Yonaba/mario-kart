function garbageC_track()
	tr1 = nil
	tr2 = nil
	tr3 = nil
	tr4 = nil
	tr5 = nil
	tr6 = nil
	font = nil
	t1 = nil
	t2 = nil
	t3 = nil
	t4 = nil
	t5 = nil
	t6 = nil
	t11 = nil
	t22 = nil
	t33 = nil
	t44 = nil
	t55 = nil
	t66 = nil
	current_track = nil
	oldpad = nil
	pad = nil
	track = nil
	collectgarbage()
end

wall = Image.load("Menu/back2.png")

--track Images
tr1 = Image.load("Sprites/Tracks/Flower Cup/Toad's turnpike/TT.png")
tr2 = Image.load("Sprites/Tracks/Star Cup/Wario Stadium/WT.png")
tr3 = Image.load("Sprites/Tracks/Mushroom Cup/Kalimari Desert/KD.png")
tr4 = Image.load("Sprites/Tracks/Mushroom Cup/Koopa Troopa Beach/KB.png")
tr5 = Image.load("Sprites/Tracks/Mushroom Cup/Moo Moo Farm/MMF.png")
tr6 = Image.load("Sprites/Tracks/Mushroom Cup/Luigi Raceway/LR.png")

--fonts
font = Font.load("fonts/mario.ttf")
font:setPixelSizes(20,20)

--tracks times recovery
file = io.open("results/1.spl" , "r")
t1 = file:read()
file:close()
file = io.open("results/1temp.spl" , "r")
t11 = file:read()
file:close()

file = io.open("results/2.spl" , "r")
t2 = file:read()
file:close()

file = io.open("results/2temp.spl" , "r")
t22 = file:read()
file:close()

file = io.open("results/3.spl" , "r")
t3 = file:read()
file:close()

file = io.open("results/3temp.spl" , "r")
t33 = file:read()
file:close()

file = io.open("results/4.spl" , "r")
t4 = file:read()
file:close()

file = io.open("results/4temp.spl" , "r")
t44 = file:read()
file:close()

file = io.open("results/5.spl" , "r")
t5 = file:read()
file:close()

file = io.open("results/5temp.spl" , "r")
t55 = file:read()
file:close()

file = io.open("results/6.spl" , "r")
t6 = file:read()
file:close()

file = io.open("results/6temp.spl" , "r")
t66 = file:read()
file:close()

current_track = 1
Oldpad = Controls.read()
track = {
	img = tr1;
}

while true do
	screen:clear()
	pad = Controls.read()
	screen:blit(0,0,wall)
	screen:fontPrint(font,145,20,"Select Your Track", Color.new(0,0,255))

	if pad:right() and not oldpad:right() then current_track = current_track + 1 end
	if pad:left() and not oldpad:left() then current_track = current_track - 1 end

	if current_track == 1 then track.img = tr1 end
	if current_track == 2 then track.img = tr2 end
	if current_track == 3 then track.img = tr3 end
	if current_track == 4 then track.img = tr4 end
	if current_track == 5 then track.img = tr5 end
	if current_track == 6 then track.img = tr6 end

	if current_track > 6 then current_track = 1 end
	if current_track < 1 then current_track = 6 end

	t1 = math.min(t1,t11)
	t2 = math.min(t2,t22)
	t3 = math.min(t3,t33)
	t4 = math.min(t4,t44)
	t5 = math.min(t5,t55)
	t6 = math.min(t6,t66)

	screen:fontPrint(font,225,160,"Select The Mode", Color.new(255,0,0))
	screen:fontPrint(font,215,200,"O : Time Challenge", Color.new(250,255,0))
	screen:fontPrint(font,270,225,"[]: Race", Color.new(250,255,0))

	if current_track == 1 then
		if pad:circle() and not oldpad:circle() then
			garbageC_track()
			dofile("race1.lua")
		elseif pad:square() and not oldpad:square() then
			garbageC_track()
			dofile("race11.lua")
		end
		screen:blit(20,88,track.img)
		screen:fontPrint(font,200,80,"Toad's TurnSpike", Color.new(255,0,0))
		screen:fontPrint(font,200,100,"Best Time: "..t1.." Seconds", Color.new(255,255,0))
	end

	if current_track == 2 then
		if pad:circle() and not oldpad:circle() then
			garbageC_track()
			dofile("race2.lua")
		elseif pad:square() and not oldpad:square() then
			garbageC_track()
			dofile("race22.lua")	
		end
		screen:blit(20,88,track.img)
		screen:fontPrint(font,200,80,"Wario Stadium", Color.new(255,0,0))
		screen:fontPrint(font,200,100,"Best Time: "..t2.." Seconds", Color.new(255,255,0))
	end

	if current_track == 3 then
		if pad:circle() and not oldpad:circle() then
			garbageC_track()
			dofile("race3.lua")
		elseif pad:square() and not oldpad:square() then
			garbageC_track()
			dofile("race33.lua")	
		end
		screen:blit(20,88,track.img)
		screen:fontPrint(font,200,80,"KaliMari Desert", Color.new(255,0,0))
		screen:fontPrint(font,200,100,"Best Time: "..t3.." Seconds", Color.new(255,255,0))
	end

	if current_track == 4 then
		if pad:circle() and not oldpad:circle() then
			garbageC_track()
			dofile("race4.lua")
		elseif pad:square() and not oldpad:square() then
			garbageC_track()
			dofile("race44.lua")	
		end
		screen:blit(20,88,track.img)
		screen:fontPrint(font,200,80,"Koopa Troopa Beach", Color.new(255,0,0))
		screen:fontPrint(font,200,100,"Best Time: "..t4.." Seconds", Color.new(255,255,0))
	end

	if current_track == 5 then
		if pad:circle() and not oldpad:circle() then
			garbageC_track()
			dofile("race5.lua")
		elseif pad:square() and not oldpad:square() then
			garbageC_track()
			dofile("race55.lua")	
		end
		screen:blit(20,88,track.img)
		screen:fontPrint(font,200,80,"Moo Moo Farm", Color.new(255,0,0))
		screen:fontPrint(font,200,100,"Best Time: "..t5.." Seconds", Color.new(255,255,0))
	end

	if current_track == 6 then
		if pad:circle() and not oldpad:circle() then
			--Cleaning RAm from Images
			garbageC_track()
			dofile("race6.lua")
		elseif pad:square() and not oldpad:square() then
			garbageC_track()
			dofile("race66.lua")	 
		end
		screen:blit(20,88,track.img)
		screen:fontPrint(font,200,80,"Luigi RaceWay", Color.new(255,0,0))
		screen:fontPrint(font,200,100,"Best Time: "..t6.." Seconds", Color.new(255,255,0))
	end

	oldpad = pad
	screen.waitVblankStart()
	screen.flip()
end

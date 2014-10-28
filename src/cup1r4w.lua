wall = Image.load("Menu/back2.png")

--Player Id Recovery
file = io.open("data/cup1_1p.spl" , "r")
pp = file:read()
file:close()
----------------------------------------------------
----------------------------------------------------
--opponent Id recovery
file = io.open("data/cup1_1e.spl" , "r")
op = file:read()
file:close()
---------------------------------------------------
--Player Id Recovery
file = io.open("data/cup1_2p.spl" , "r")
pp2 = file:read()
file:close()
----------------------------------------------------
----------------------------------------------------
--opponent Id recovery
file = io.open("data/cup1_2e.spl" , "r")
op2 = file:read()
file:close()
---------------------------------------------------

---------------------------------------------------
--Player Id Recovery
file = io.open("data/cup1_3p.spl" , "r")
pp3 = file:read()
file:close()
----------------------------------------------------
----------------------------------------------------
--opponent Id recovery
file = io.open("data/cup1_3e.spl" , "r")
op3 = file:read()
file:close()
---------------------------------------------------

---------------------------------------------------
--Player Id Recovery
file = io.open("data/cup1_4p.spl" , "r")
pp4 = file:read()
file:close()
----------------------------------------------------
----------------------------------------------------
--opponent Id recovery
file = io.open("data/cup1_4e.spl" , "r")
op4 = file:read()
file:close()
---------------------------------------------------


font = Font.load("fonts/mario.ttf")
font:setPixelSizes(25,25)

player = {
	x = 20;
	y = 100;
	img = p1;
	walk = 0;
}

opponent = {
	x = - 50;
	y = 100;
	img = o1;
	walk = 1;
}

pp = pp + pp2 + pp3 + pp4
op = op + op2 + pp3 + pp4

while true do
	screen:clear()
	pad = Controls.read()
	screen:blit(0,0,wall)

	if pp >= op then
		screen:fontPrint(font,120,30,"Congratulations !", Color.new(0,0,255))
		screen:fontPrint(font,50,55,"You've Won The Cup", Color.new(0,0,255))
		screen:fontPrint(font,70,100,"Your Score : "..pp.." Points", Color.new(255,255,0))
		screen:fontPrint(font,70,130,"Opponent Score : "..op.." Points", Color.new(255,255,0))
	elseif op > pp then
		screen:fontPrint(font,120,30,"What A Shame !", Color.new(0,0,255))
		screen:fontPrint(font,50,55,"You've lost the Cup", Color.new(0,0,255))
		screen:fontPrint(font,70,130,"Your Score : "..pp.." Points", Color.new(255,255,0))
		screen:fontPrint(font,70,100,"Opponent Score : "..op.." Points", Color.new(255,255,0))
	end

	if pad:cross() and op > pp then 
		wall = nil
		t1 = nil
		font = nil
		collectgarbage()
		dofile("menu.lua") 
	elseif pad:cross() and pp >= op then 
		file = io.open("data/hack.spl", "w")
		file:write("unlocked")
		file:close()
		wall = nil
		t1 = nil
		font = nil
		collectgarbage()
		dofile("menu.lua") 
	end

	screen.waitVblankStart()
	screen.flip()
end


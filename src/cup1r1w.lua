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

while true do
	screen:clear()
	pad = Controls.read()
	screen:blit(0,0,wall)

	screen:fontPrint(font,120,30,"Congratulations !", Color.new(0,0,255))
	screen:fontPrint(font,50,55,"You've Won The 1rst Race !", Color.new(0,0,255))
	screen:fontPrint(font,70,100,"Your Score : "..pp.." Points", Color.new(255,255,0))
	screen:fontPrint(font,70,130,"Opponent Score : "..op.." Points", Color.new(255,255,0))

	if pad:cross() then 
		wall = nil
		t1 = nil
		font = nil
		collectgarbage()
		dofile("cup1_2.lua") 
	end

	screen.waitVblankStart()
	screen.flip()
end

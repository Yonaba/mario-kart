wall = Image.load("Menu/back2.png")

--Player Id Recovery
file = io.open("data/player.spl" , "r")
player = file:read()
file:close()
----------------------------------------------------
----------------------------------------------------
--Player Sprites Loading
p1 = Image.load("Sprites/select/"..player.."/1.png")
p2 = Image.load("Sprites/select/"..player.."/2.png")
p3 = Image.load("Sprites/select/"..player.."/3.png")
p4 = Image.load("Sprites/select/"..player.."/4.png")
-----------------------------------------------------

--time recovery
file = io.open("results/temp.spl" , "r")
t1 = file:read()
file:close()

font = Font.load("fonts/mario.ttf")
font:setPixelSizes(25,25)

player = {
	x = 20;
	y = 100;
	img = p1;
	walk = 0;
}

while true do
	screen:clear()
	pad = Controls.read()
	screen:blit(0,0,wall)

	player.x = player.x + 3
	if player.x >= 520 then player.x = - 50 end
	player.walk = player.walk + 1.5
	if player.walk >= 0 then player.img = p1 end
	if player.walk >= 5 then player.img = p2 end
	if player.walk >= 10 then player.img = p3 end
	if player.walk >= 15 then player.img = p4 end
	if player.walk >= 20 then player.walk = 0 end

	screen:fontPrint(font,120,30,"Congratulations !", Color.new(0,0,255))
	screen:fontPrint(font,50,55,"You've Finished The Race !", Color.new(0,0,255))
	screen:fontPrint(font,100,220,"Your Time: "..t1.." Seconds", Color.new(255,255,0))
	screen:fontPrint(font,170,250,"Press Start", Color.new(255,255,0))

	if pad:start() then 
		wall = nil
		t1 = nil
		font = nil
		collectgarbage()
		dofile("menu2.lua") 
	end

	screen:blit(player.x,player.y,player.img)
	screen.waitVblankStart()
	screen.flip()
end


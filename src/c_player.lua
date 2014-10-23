Linker = loadfile("linker.lua")

if Linker == nil then
	screen:clear()
	screen:print(10,10,"File Loading Failed", Color.new(255,0,0))
	screen:print(10,20,"Reinstall Homebrew Please", Color.new(255,0,0))
	screen.flip()
end

function garbageC_player()
	bowser = nil
	donkey = nil
	drybones = nil
	luigi = nil
	mario = nil
	peach = nil
	petey = nil
	toad = nil
	waluigi = nil
	wario = nil
	wall = nil
	font = nil
	select = nil
	cursor = nil
	oldpad = nil
	pad = nil
	dx = nil
	collectgarbage()
end

--Loading Sprites 
bowser = Image.load("Sprites/select/bowser.png")
donkey = Image.load("Sprites/select/donkey.png")
drybones = Image.load("Sprites/select/drybones.png")
luigi = Image.load("Sprites/select/luigi.png")
mario = Image.load("Sprites/select/mario.png")
peach = Image.load("Sprites/select/peach.png")
petey = Image.load("Sprites/select/petey.png")
toad = Image.load("Sprites/select/toad.png")
waluigi = Image.load("Sprites/select/waluigi.png")
wario = Image.load("Sprites/select/wario.png")
-------------------------------
wall = Image.load("Menu/back2.png")
font = Font.load("fonts/mario.ttf")
font:setPixelSizes(20,20)

state = "left"

cursor = {
	x = 55;
	y = 45;
}
oldpad = Controls.read()

l = math.random(1,5)
r = math.random(6,10)

while true do
	screen:clear()
	--pad and analog
	pad = Controls.read()
	
	screen:blit(0,0,wall)
	screen:blit(100,20,bowser)
	screen:blit(100,60,donkey)
	screen:blit(100,100,drybones)
	screen:blit(100,140,luigi)
	screen:blit(100,180,mario)
	screen:blit(300,20,peach)
	screen:blit(300,60,petey)
	screen:blit(300,100,toad)
	screen:blit(300,140,waluigi)
	screen:blit(300,180,wario)
	screen:fontPrint(font,cursor.x,cursor.y,"==>",Color.new(255,250,0))

	if state == "left" then cursor.x = 55
	elseif state == "right" then cursor.x = 255 end

	if pad:right() and not oldpad:right() and state == "left" then state = "right" end
	if pad:left() and not oldpad:left() and state == "right" then state = "left" end

	if pad:down() and not oldpad:down() and cursor.y < 180 then cursor.y = cursor.y + 40 end
	if pad:up() and not oldpad:up() and cursor.y > 45 then cursor.y = cursor.y - 40 end

	if l == 1 then opl = "bowser"
	elseif l == 2 then opl = "donkey"
	elseif l == 3 then opl = "drybones"
	elseif l == 4 then opl = "luigi"
	elseif l == 5 then opl = "mario" end
	if r == 6 then opr = "peach"
	elseif r == 7 then opr = "petey"
	elseif r == 8 then opr = "toad"
	elseif r == 9 then opr = "waluigi"
	elseif r == 10 then opr = "wario" end

	if state == "left" and pad:cross() and oldpad:cross() ~=pad:cross() then
		file= io.open("data/opponent1.spl", "w")
		file:write(""..opr.."_sprites")
		file:close()
		if cursor.y == 45 then
			file = io.open("data/player.spl", "w")
			file:write("bowser_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")	
		elseif cursor.y == 85 then
			file = io.open("data/player.spl", "w")
			file:write("donkey_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")	
		elseif cursor.y == 125 then
			file = io.open("data/player.spl", "w")
			file:write("drybones_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")	
		elseif cursor.y == 165 then
			file = io.open("data/player.spl", "w")
			file:write("luigi_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")
		elseif cursor.y == 205 then
			file = io.open("data/player.spl", "w")
			file:write("mario_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")	
		end

	elseif state == "right" and pad:cross() and oldpad:cross() ~=pad:cross() then	
		file= io.open("data/opponent1.spl", "w")
		file:write(""..opl.."_sprites")
		file:close()
		if cursor.y == 45 then
			file = io.open("data/player.spl", "w")
			file:write("peach_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")		
		elseif cursor.y == 85 then
			file = io.open("data/player.spl", "w")
			file:write("petey_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")
		elseif cursor.y == 125 then
			file = io.open("data/player.spl", "w")
			file:write("toad_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")
		elseif cursor.y == 165 then
			file = io.open("data/player.spl", "w")
			file:write("waluigi_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")
		elseif cursor.y == 205 then
			file = io.open("data/player.spl", "w")
			file:write("wario_sprites")
			file:close()
			garbageC_player()
			dofile("linker.lua")	
		end	
	end

	oldpad = pad
	screen.waitVblankStart()
	screen.flip()
end






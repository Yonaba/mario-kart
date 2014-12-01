file = io.open("data/options.spl", "r")
way = file:read()
file:close()

if way == "GrandPrix" then 
  file = io.open("data/cup.spl", "r")
  cup = file:read()
  file:close()
  if cup == "cup1" then dofile("cup1_1.lua")
  elseif cup == "cup2" then dofile("cup2_1.lua")
  elseif cup == "cup3" then dofile("cup3_1.lua")
  end
  elseif way == "TimeTrial" then dofile("c_track.lua")
end

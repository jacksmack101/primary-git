
module(..., package.seeall)

local tileImageNames = {
"tile_A_0001.png",-- base tile
"tile_A_0002.png",-- base tile
"tile_A_0500.png",-- slope 1-1 downhill 
"tile_A_0501.png",--
"tile_A_0502.png",--
"tile_A_0503.png",--
"tile_A_0504.png",-- slope 2 downhill
"tile_A_0505.png",--
"tile_A_0550.png",-- slope 1 uphill
"tile_A_0551.png",--
"tile_A_0552.png",--
"tile_A_0553.png",--
"tile_A_0554.png",-- slope 2 uphill
"tile_A_0555.png",--
}

local walkable = {0,3,4,5,6,7,8,9,10,11,12,13,14}



function isWalkable(NUM)
  local var = false
  for i=1,#walkable do
      if NUM == walkable[i] then
          var = true
      end
      
  end
  
  return var
end


function findTileNumber(NUM, SPRITEDATA)
    
    for i=1, #SPRITEDATA.frames do
        if SPRITEDATA.frames[i].name == tileImageNames[NUM] then
            return i
        end
        
    end 
end


module(..., package.seeall)

function getMapVars()
    local lvl = {}
    lvl.tileSize = 30
    lvl.gravity = .8
    lvl.xStart = 4
    lvl.yStart = 4
    return lvl
    
end

function loadMapData()
   local map ={}
   map={{1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1}}
              
    print('map loaded')
    
    return map

end
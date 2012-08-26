
module(..., package.seeall)

function createHero(lvl)
    local sideOffsetTop = 18
    local sideOffsetBot = 12
  local var = {}
  var.xpos = 0
  var.ypos = 0
  var.xspeed = 0
  var.yspeed = 0
  var.accel = 1 
  
  var.xStart = lvl.xStart
  var.yStart = lvl.yStart
  
  var.hitWidth = 18
  var.hitHeight = 50
  var.hitXoffset = 8
  var.hitYoffset = 4
  var.maxXspeed = 4
  var.maxYspeed = 15
  var.maxYwallSpeed = 2.4
  var.jumpSpeed = 14
  var.dir = 1
  var.falling = false
  var.jumping = false
  var.onSlope = false
  var.onWall = ""
  var.lastWall = ""
  var.wallCount = 0
  var.wallCountTarg = 4

--  corners.left = math.ceil((OBJ.xpos  - ((OBJ.hitWidth)/2)) / lvl.tileSize)
--    corners.right = math.ceil((OBJ.xpos  + ((OBJ.hitWidth)/2)) / lvl.tileSize)
--    corners.top = math.ceil((OBJ.ypos - (OBJ.hitHeight-3)) / lvl.tileSize)
--    corners.bottom = math.ceil((OBJ.ypos-3 ) / lvl.tileSize)
    
  
  local heroGroup = display.newGroup()
  local hero = display.newRect(0, 0, var.hitWidth, var.hitHeight)
  hero:setFillColor(200, 0, 0,80 )  
  lvl.mapGroup:insert( hero )
  heroGroup:insert(hero)
  
  heroGroup:setReferencePoint( display.BottomCenterReferencePoint )
  heroGroup.x = lvl.tileSize * (var.xStart - 1)
  heroGroup.y = lvl.tileSize * (var.yStart - 1)
  
  local dotSize = 4
   
    local topDot = display.newCircle( (var.hitWidth/2), 5, dotSize )
    topDot:setFillColor(255,0,0,200)
    heroGroup:insert(topDot)
    var.topDot = topDot
    
    local botDot = display.newCircle( (var.hitWidth/2), var.hitHeight - var.hitYoffset , dotSize )
    botDot:setFillColor(0,255,0,200)
    heroGroup:insert(botDot)
    var.botDot = botDot
    
    local topLeftDot = display.newCircle( 0, sideOffsetTop, dotSize )
    topLeftDot:setFillColor(255,255,0,200)
    heroGroup:insert(topLeftDot)
    var.topLeftDot = topLeftDot
    
    local botLeftDot = display.newCircle( 0, (var.hitHeight - sideOffsetBot), dotSize )
    botLeftDot:setFillColor(255,255,0,200)
    heroGroup:insert(botLeftDot)
    var.botLeftDot = botLeftDot
    
    
    local topRightDot = display.newCircle( var.hitWidth, sideOffsetTop, dotSize )
    topRightDot:setFillColor(0,255,255,200)
    heroGroup:insert(topRightDot)
    var.topRightDot = topRightDot
    
    local botRightDot = display.newCircle( var.hitWidth, (var.hitHeight - sideOffsetBot ), dotSize )
    botRightDot:setFillColor(0,255,255,200)
    heroGroup:insert(botRightDot)
    var.botRightDot = botRightDot
    
  var.hitBox = heroGroup
  return var
end



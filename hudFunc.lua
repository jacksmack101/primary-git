
module(..., package.seeall)

function createHero(lvl)
  local var = {}
  var.xpos = 0
  var.ypos = 0
  var.xspeed = 0
  var.yspeed = 0
  
  var.xStart = lvl.xStart
  var.yStart = lvl.yStart
  
  var.hitWidth = 10
  var.hitHeight = 20
  var.hitXoffset = 5
  var.hitYoffset = 15
  var.maxXspeed = 6
  var.maxYspeed = 11
  
  var.falling = false
  
  local hero = display.newRect(0, 0, 20, 40)
  hero:setFillColor(0, 200, 0 )  
  hero:setReferencePoint( display.TopLeftReferencePoint )
  lvl.mapGroup:insert( hero )
  
  hero.x = lvl.tileSize * (var.xStart - 1)
  hero.y = lvl.tileSize * (var.yStart - 1)
  
  var.clip = hero
  return var
end



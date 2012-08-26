----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

require "sprite"
require "hero"
require "tileCheck"
local loqsprite = require ("loq_sprite")
local heroFactory = loqsprite.newFactory("royAnimations")
local heroClip = heroFactory:newSpriteGroup()
heroClip.alpha = 0
heroClip:setReferencePoint( display.BottomCenterReferencePoint )
-- universal variables -----------------------------------------

local gamePaused = false
local bg
local map
local heroVar
local lvl
local mapClip
local buttonList = {}
local activeTouches = {}


local slopes = {{3},{4},{5},{6},{9},{10},{11},{12},{7},{8},{13},{14}}
-- \      /
--  \    /
--   \  /
--    \/

----------------------------------------------------------------

-- Touch event listener for background image
local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		storyboard.gotoScene( "scene2", "fade", 400  )
		
		return true
	end
end


--  TOUCH EVENT LISTENER FOR MOVING FINGERS AND STUFF.
local function onTouchFunc(self, event)
   -- print(event.id)
        local upBounds = buttonList.up.contentBounds
        local downBounds = buttonList.down.contentBounds
        local leftBounds = buttonList.left.contentBounds
        local rightBounds = buttonList.right.contentBounds
        local targetButton = nil
        
        local currBound = upBounds
        if event.x >= currBound.xMin 
            and event.x <= currBound.xMax
            and event.y >= currBound.yMin
            and event.y <= currBound.yMax then
            targetButton = 'up'
        end
        
        currBound = downBounds
        if event.x >= currBound.xMin 
            and event.x <= currBound.xMax
            and event.y >= currBound.yMin
            and event.y <= currBound.yMax then
            targetButton = 'down'
            
        end
        
        currBound = leftBounds
        if event.x >= currBound.xMin 
            and event.x <= currBound.xMax
            and event.y >= currBound.yMin
            and event.y <= currBound.yMax then
            targetButton = 'left'
            
        end
        
        currBound = rightBounds
        if event.x >= currBound.xMin 
            and event.x <= currBound.xMax
            and event.y >= currBound.yMin
            and event.y <= currBound.yMax then
            targetButton = 'right'
            
        end
        
    if event.phase == "began" then
       -- print('began touch')
        display.getCurrentStage():setFocus(event.target)
        table.insert(activeTouches,{event.id, targetButton})
    elseif event.phase == "moved" then
        --print('moved touch to x:'..event.x.." y:"..event.y )
        if targetButton == nil then
            
        else
         -- print('touching '..targetButton)
        end
    end
     for i=1,#activeTouches do
              if activeTouches[i][1] == event.id then
                if activeTouches[i][2] ~= targetButton then
                    activeTouches[i][2] = targetButton
                end
            end
            
                --table.remove(activeTouches, i )
                  
       -- print("touches: "..#activeTouches)
    end
    
    
    if event.phase ~= 'ended'  and event.phase ~= "cancelled" then
        
        if targetButton == "up" then
            --targetButton = buttonList.up
            if not gamePaused then
                if heroVar.falling == false then
                    heroVar.jumping = true
                end
                if heroVar.onWall ~= "" then
                    heroVar.jumping = true
                end
            end
        elseif targetButton == "down" then
            --targetButton = buttonList.down
            if gamePaused then
                gamePaused = false    
            else
                gamePaused = true
            end
            
            
        elseif targetButton == "left" then
            --targetButton = buttonList.left
            heroVar.xspeed = heroVar.xspeed - heroVar.accel
            
        elseif targetButton == 'right' then
            --targetButton = buttonList.right
            
            heroVar.xspeed = heroVar.xspeed + heroVar.accel
            
        end
        --print('xspeed '..heroVar.xspeed)
    elseif event.phase == 'ended'  or event.phase == "cancelled" then
        --print(#activeTouches)
        if targetButton == "up" then
            --targetButton = buttonList.up
            if heroVar.falling == true and heroVar.yspeed < 0 then
                heroVar.yspeed = heroVar.yspeed/2
            end
        elseif targetButton == "down" then
            --targetButton = buttonList.down
            
            
        elseif targetButton == "left" then
            --targetButton = buttonList.left
            --heroVar.xspeed = heroVar.xspeed - heroVar.accel
            
        elseif targetButton == 'right' then
            --targetButton = buttonList.right
            
            --heroVar.xspeed = heroVar.xspeed + heroVar.accel
            
        end
        --print('xspeed '..heroVar.xspeed)
    
        for i=1,#activeTouches do
              if activeTouches[i][1] == event.id then
                --activeTouches[i] = nil
                table.remove(activeTouches, i )
                  
        print(#activeTouches)
              end
              
        end
    end
    
    
    
end


local function checkCorners(OBJ)
    local corners = {}
        
    local topPos = (OBJ.ypos - OBJ.hitHeight) + OBJ.topDot.y
    local botPos = (OBJ.ypos - OBJ.hitHeight) + OBJ.botDot.y
    local centerXPos = OBJ.xpos
    local centerYPos = OBJ.ypos - (OBJ.hitHeight/2)
    local rightXPos = (OBJ.xpos - (OBJ.hitWidth/2)) + OBJ.topRightDot.x
    local leftXPos = (OBJ.xpos - (OBJ.hitWidth/2)) + OBJ.topLeftDot.x
    local sideTopY = (OBJ.ypos - OBJ.hitHeight) + OBJ.topLeftDot.y
    local sideBotY = (OBJ.ypos - OBJ.hitHeight) + OBJ.botLeftDot.y
   
   
    corners.centerX = math.ceil(centerXPos / lvl.tileSize)
    corners.centerY = math.ceil(centerYPos / lvl.tileSize)
    corners.left = math.ceil(leftXPos / lvl.tileSize)
    corners.right = math.ceil(rightXPos / lvl.tileSize)
    corners.top = math.ceil(topPos / lvl.tileSize)
    corners.bottom = math.ceil(botPos / lvl.tileSize)
    
    
    corners.sideTopY = math.ceil(sideTopY / lvl.tileSize)
    corners.sideBotY = math.ceil(sideBotY / lvl.tileSize)
    corners.above = math.ceil((topPos -1) / lvl.tileSize)
    corners.under = math.ceil((botPos + 1) / lvl.tileSize)
    
    heroVar.bottom = corners.bottom
    heroVar.centerX = corners.centerX

return corners

end

function isSlope(NUM)
  local returnVar = false
  for i=1,#slopes do
    for j=1,#slopes[i] do
      if NUM == slopes[i][j] then
          returnVar = true
      end
    end  
  end
  
  return var
end

local function setSlopePlacement()
    local tileNum = nil
    heroVar.onSlope = false
    
    if not heroVar.jumping then
    for i=1,#slopes do
        for j=1,#slopes[i] do

            if heroVar.BC == slopes[i][j] then
                tileNum = i
                if i == 4 or i == 5 then
                    if not tileCheck.isWalkable(heroVar.UBC) then
                        heroVar.ypos = heroVar.ypos -2
                    end
                end
                
            
            end

        end    
    end
    local onSlope = heroVar.onSlope
    
    local xDist = (heroVar.xpos) - ((heroVar.centerX-1) * lvl.tileSize)
    local yDist = (heroVar.bottom-1) * lvl.tileSize
    local yGoal = yDist
    if tileNum ~= nil then
        --print('tileNum: '..tileNum)
                
        if tileNum == 1 then
            yGoal = yDist +  math.floor( xDist / 4 )+4 
            
            if heroVar.yspeed > 0 and heroVar.yspeed < 1 then
                    
                heroVar.yspeed = 0
                heroVar.falling = false
            end
                
                
            
        elseif tileNum == 2 then
            yGoal = yDist +  math.floor(xDist / 4) + 12
            
        elseif tileNum == 3 then
            yGoal = yDist +  math.floor(xDist / 4) + 20
            
        elseif tileNum == 4 then
            yGoal = yDist +  math.floor(xDist / 4) + 28
            
        elseif tileNum == 5 then
            yGoal = yDist + 36 - math.floor(xDist / 4) 
            
        elseif tileNum == 6 then
            yGoal = yDist -  math.floor(xDist / 4) + 28
            
        elseif tileNum == 7 then
            yGoal = yDist -  math.floor(xDist / 4) + 20
            
        elseif tileNum == 8 then
            yGoal = yDist -  math.floor(xDist / 4) + 12
            
        elseif tileNum == 9 then
            yGoal = yDist + math.floor(xDist / 2) + 3
            
        elseif tileNum == 10 then
            yGoal = yDist + math.floor(xDist / 2) + 18
            
        elseif tileNum == 11 then
            yGoal = yDist + 18 - math.floor(xDist / 2) 
            
        elseif tileNum == 12 then
            yGoal = yDist + 36 - math.floor(xDist / 2)            
        end
        
            
        if heroVar.falling then
            if heroVar.ypos +heroVar.yspeed >= yGoal then
                heroVar.ypos = yGoal+1
                heroVar.yspeed = 0
                heroVar.falling = false
            
                    heroVar.onSlope = true
            end
            
        else
            heroVar.ypos = yGoal
            
                    heroVar.onSlope = true
        end
        
    end
    
    
    end

end

local function enterFrameFunc(event)
    
    if not gamePaused then
        
        
    heroVar.ypos = heroVar.ypos + heroVar.yspeed
    local  corners = checkCorners(heroVar)
   
    local TL = map[corners.sideTopY][corners.left]
    local TR = map[corners.sideTopY][corners.right]
    local BL = map[corners.sideBotY][corners.left]
    local BR = map[corners.sideBotY][corners.right]
    local TC = map[corners.top][corners.centerX]
    local BC = map[corners.bottom][corners.centerX]
    local UBC = map[corners.under][corners.centerX]
    heroVar.BC = BC
    heroVar.UB = UBC
    heroVar.falling = false
       
      
     --print("BC: "..BC)         
    
    if math.abs ( heroVar.xspeed ) > heroVar.maxXspeed then
        if heroVar.xspeed > 0 then
            heroVar.xspeed = heroVar.maxXspeed
        else
            heroVar.xspeed = -heroVar.maxXspeed
        end
        
        
    end
    if not tileCheck.isWalkable(BC)  then
        while not tileCheck.isWalkable(BC) do
            heroVar.ypos = heroVar.ypos - 1
            corners = checkCorners(heroVar)
            BC = map[corners.bottom][corners.centerX]
            UBC = map[corners.under][corners.centerX]
        end
        

    end
    
    if heroVar.xspeed < 0  then
        heroVar.dir = 1
        if not tileCheck.isWalkable(BL)
        and not tileCheck.isWalkable(TL)
        and heroVar.onWall == "" then
            heroVar.wallCount = heroVar.wallCount +1
            if heroVar.wallCount >= heroVar.wallCountTarg then
                 heroVar.onWall = "left"
            end
        end
        if tileCheck.isWalkable(BL)
        and tileCheck.isWalkable(TL)
        or heroVar.onSlope then
            heroVar.wallCount = 0
            heroVar.lastWall = heroVar.onWall
            heroVar.onWall = ""
        end
        if not tileCheck.isWalkable(BL)
        or not tileCheck.isWalkable(TL) then
            heroVar.xspeed = 0
        end
    end
                
    if heroVar.xspeed > 0  then
            heroVar.dir = -1
        if  not tileCheck.isWalkable(BR) 
        and not tileCheck.isWalkable(TR) 
        and heroVar.onWall == "" then
            heroVar.wallCount = heroVar.wallCount +1
            if heroVar.wallCount >= heroVar.wallCountTarg then
                 heroVar.onWall = "right"
            end
            
        end
        if  tileCheck.isWalkable(BR) 
        and tileCheck.isWalkable(TR)
        or heroVar.onSlope then
            heroVar.wallCount = 0
            heroVar.lastWall = heroVar.onWall
            heroVar.onWall = ""
        end
        if  not tileCheck.isWalkable(BR) 
        or not tileCheck.isWalkable(TR) then
            heroVar.xspeed = 0
        end
    end
    
    
    
    
    if heroVar.yspeed < 0 then
        if  not tileCheck.isWalkable(TC) then
            heroVar.yspeed = 0
        end
    end
    
    if heroVar.yspeed > 0 then
        heroVar.jumping = false
        print("ypos: "..heroVar.ypos )
        
    end
    
    
    
    
    if tileCheck.isWalkable(UBC)  then
        if not heroVar.onSlope then
            heroVar.falling = true
        end
    else 
        if not tileCheck.isWalkable(BC) then
            heroVar.falling = false
            heroVar.yspeed = 0
            
            heroVar.lastWall = ""
            heroVar.onWall = ""
        end

    end
    
    
    
   
       
    
    if heroVar.falling then
        
        if heroVar.onWall ~= "" then
            if heroVar.yspeed + lvl.gravity < heroVar.maxYwallSpeed then
                heroVar.yspeed = heroVar.yspeed + lvl.gravity
            else
                heroVar.yspeed = heroVar.maxYwallSpeed
            end
        else
            
            if heroVar.yspeed + lvl.gravity < heroVar.maxYspeed then
                heroVar.yspeed = heroVar.yspeed + lvl.gravity
            else
                heroVar.yspeed = heroVar.maxYspeed
            end
        end
    
        
        
    else
        
        if heroVar.jumping then
            heroVar.yspeed = -heroVar.jumpSpeed
            heroVar.falling = true
        else
            heroVar.yspeed = 0
            heroVar.wallCount = 0
            heroVar.lastWall = ""
            heroVar.onWall = ""
        end
        
    end
    
    
    
    setSlopePlacement()
       
    
    
        print("wallCount: "..heroVar.wallCount)
        print("onWall: "..heroVar.onWall)
    heroVar.xpos = heroVar.xpos + heroVar.xspeed
    heroVar.xpos = math.round( heroVar.xpos )
    heroVar.ypos = math.round( heroVar.ypos )
    heroVar.clip.x = heroVar.xpos
    heroVar.clip.y = heroVar.ypos +4
    
    heroVar.clip.xScale = heroVar.dir
    heroVar.hitBox.x = heroVar.xpos
    heroVar.hitBox.y = heroVar.ypos
    setMapPosition()
    end -- end pause check 
end

function setMapPosition()

    mapClip.x = display.contentCenterX - heroVar.xpos
    mapClip.y = display.contentCenterY - heroVar.ypos + 30
    
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
        mapClip = display.newGroup( )
        -- test
	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
        bg = display.newRect(0, 0, display.contentWidth, display.contentHeight)
        bg:setFillColor( 80, 80, 80 ) 
        bg:setReferencePoint( display.TopLeftReferencePoint )
	group:insert( bg )
        
        bg.touch = onSceneTouch
        
        local params = event.params
        
        print( "MAP TO LOAD: "..params.mapToLoad ) 
        local mapVar = require(params.mapToLoad)
        lvl = mapVar.getMapVars()
        map = mapVar.loadMapData()
        
        lvl.mapWidth = #map[1]
        lvl.mapHeight = #map
        
        local sheetData = require "tileSheet"
        local spriteData =sheetData.getSpriteSheetData()
        local spriteSheet = sprite.newSpriteSheetFromData( "tileSheet.png", spriteData )
        
        
        
            
        for i=1,#map do
            for j=1,#map[i] do 
                if map[i][j] == 0 then
                    
                    
                else
                    --local spriteSet = sprite.newSpriteSet(spriteSheet, map[i][j], 1)
                    
                    local spriteSet = sprite.newSpriteSet(spriteSheet, tileCheck.findTileNumber(map[i][j], spriteData) , 1)
                    
                    local thisTile = sprite.newSprite(spriteSet)  
                    thisTile:setReferencePoint( display.TopLeftReferencePoint )
                    mapClip:insert(thisTile)
                    thisTile.x = lvl.tileSize * (j - 1)
                    thisTile.y = lvl.tileSize * (i - 1)
                end
            end
        end
        group:insert( mapClip )
        lvl.mapGroup = mapClip
        heroVar = hero.createHero(lvl);
        
        heroVar.clip = heroClip
        heroVar.clip.alpha = 1
        
        --atrace(xinspect(heroClip:getSpriteNames()))
        
        heroVar.clip.x = lvl.tileSize * (heroVar.xStart - 1)
        heroVar.clip.y = lvl.tileSize * (heroVar.yStart - 1)
        heroVar.xpos = heroVar.clip.x
        heroVar.ypos = heroVar.clip.y
        heroVar.hitBox.x = heroVar.clip.x
        heroVar.hitBox.y = heroVar.clip.y
        mapClip:insert( heroVar.clip)
        mapClip:insert( heroVar.hitBox )
        setMapPosition()
        
        heroClip:play("blueIdle")
        
        -- ADD HUD BUTTONS
        local up = display.newImage ("upx.png")
        up.x = 70
        up.y = 230
        buttonList.up = up
        up.touch = onTouchFunc

        local down = display.newImage ("downx.png")
        down.x = 400
        down.y = 290
        buttonList.down = down
        down.touch = onTouchFunc

        local left = display.newImage ("leftx.png")
        left.x = 30
        left.y = 260
        buttonList.left = left
        left.touch = onTouchFunc

        local right = display.newImage ("rightx.png")
        right.x = 110
        right.y = 260
        buttonList.right = right
        right.touch = onTouchFunc
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	--bg:addEventListener( "touch", image )
        Runtime:addEventListener("enterFrame", enterFrameFunc)
        buttonList.up:addEventListener( "touch", up )
        buttonList.down:addEventListener( "touch", down )
        buttonList.left:addEventListener( "touch", left )
        buttonList.right:addEventListener( "touch", image )
        
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	Runtime:removeEventListener("enterFrame", enterFrameFunc)
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene
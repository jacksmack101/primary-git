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


-- universal variables -----------------------------------------


local bg
local map
local heroVar
local lvl
local mapClip
local buttonList = {}
----------------------------------------------------------------

-- Touch event listener for background image
local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		storyboard.gotoScene( "scene2", "fade", 400  )
		
		return true
	end
end


local function checkCorners(OBJ)
    local corners = {}
    -- corners { bottomLeft  BottomRight }
corners.left = math.ceil((OBJ.xpos  + OBJ.hitXoffset) / lvl.tileSize)
corners.right = math.ceil((OBJ.xpos + OBJ.hitXoffset + OBJ.hitWidth) / lvl.tileSize)
corners.top = math.ceil((OBJ.ypos + OBJ.hitYoffset) / lvl.tileSize)
corners.bottom = math.ceil((OBJ.ypos + OBJ.hitYoffset + OBJ.hitWidth) / lvl.tileSize)
corners.under = math.ceil((OBJ.ypos + OBJ.hitYoffset + OBJ.clip.height) / lvl.tileSize)

    if corners.top > -1 and corners.left > -1 and corners.bottom < #map and corners.right < #map[1] then 

    --print("BOT ".. corners.bottom)
    --print("TOP ".. corners.top)
    --OBJ.hitWidth
    --OBJ.hitHeight
    end

return corners

end

local function enterFrameFunc(event)
    local  corners = checkCorners(heroVar)
   
    local TL = map[corners.top][corners.left]
    local TR = map[corners.top][corners.right]
    local BL = map[corners.bottom][corners.left]
    local BR = map[corners.bottom][corners.right]
    local UBL = map[corners.under][corners.left]
    local UBR = map[corners.under][corners.right]
   
    
        heroVar.falling = false
    
    if tileCheck.isWalkable(UBL) and tileCheck.isWalkable(UBR) then
        heroVar.falling = true
        
    end
    
    --print(heroVar.falling)
    if heroVar.falling then
        if heroVar.yspeed < heroVar.maxYspeed then
            heroVar.yspeed = heroVar.yspeed + lvl.gravity

        else
            heroVar.yspeed = heroVar.maxYspeed

        end
    else
        heroVar.yspeed = 0
    end
    heroVar.xpos = heroVar.xpos + heroVar.xspeed
    heroVar.ypos = heroVar.ypos + heroVar.yspeed
    heroVar.clip.x = heroVar.xpos
    heroVar.clip.y = heroVar.ypos
    
    setMapPosition()
end

function setMapPosition()

    mapClip.x = display.contentCenterX - heroVar.xpos
    mapClip.y = display.contentCenterY - heroVar.ypos
    
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
        mapClip = display.newGroup( )
        
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
        
        local sheetData = require "tileSheet"
        local spriteData =sheetData.getSpriteSheetData()
        local spriteSheet = sprite.newSpriteSheetFromData( "tileSheet.png", spriteData )
        
        
        for i=1,#map do
            for j=1,#map[i] do 
                if map[i][j] == 0 then
                    
                    
                else
                    local spriteSet = sprite.newSpriteSet(spriteSheet, map[i][j], 1)
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
        heroVar.xpos = heroVar.clip.x
        heroVar.ypos = heroVar.clip.y
        mapClip:insert( heroVar.clip)
        setMapPosition()
        
        
        -- ADD HUD BUTTONS
        local up = display.newImage ("upx.png")
        up.x = 70
        up.y = 230
        buttonList.up = up

        local down = display.newImage ("downx.png")
        down.x = 70
        down.y = 290
        buttonList.down = down

        local left = display.newImage ("leftx.png")
        left.x = 30
        left.y = 260
        buttonList.left = left

        local right = display.newImage ("rightx.png")
        right.x = 110
        right.y = 260
        buttonList.right = right
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	--bg:addEventListener( "touch", image )
        Runtime:addEventListener("enterFrame", enterFrameFunc)
        
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
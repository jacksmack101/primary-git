--[[
Spriteloq metadata
Generated by SpriteLoq: Loqheart's Flash SWF to sprite sheet Corona SDK exporter (c) Loqheart 2011
version 1.4.10
target Corona SDK
extension lua
exportName royAnimations
exportPath file:///C:/Users/Daves%20Laptop/Desktop/Jacksmack/CoronaGames/PrimaryTileEngine
sheetSize 256x256
sources 3
name; url; referencePoint; startFrame; totalFrames; frameRate; topLeft; bottomRight; sourceRect; loopParam; includeReverse; rasterize
yellowIdle; royswfs/yellowIdle.swf; (x=0, y=0); 1; 26; 30; (x=-2, y=-1); (x=28, y=53); (x=-4, y=-3, w=34, h=58); 0; false; false
redIdle; royswfs/redIdle.swf; (x=0, y=0); 1; 26; 30; (x=-2, y=-1); (x=28, y=53); (x=-4, y=-3, w=34, h=58); 0; false; false
blueIdle; royswfs/blueIdle.swf; (x=0, y=0); 1; 26; 30; (x=-2, y=-1); (x=28, y=53); (x=-4, y=-3, w=34, h=58); 0; false; false
assetShapes 0
]]

local sheet = false
local setInfo = false
local msFactor = 500  -- This should be 1000 ms. Corona BUG: The frame rate is playing back at around half speed at 30fps.

local function newSpriteSet(_sheet, _name, _startFrame, _frameCount, _frameRate, _loopParam, _xReference, _yReference, _spriteSourceWidth, _spriteSourceHeight, _unscaledSpriteX, _unscaledSpriteY, _unscaledSpriteWidth, _unscaledSpriteHeight, _frames, _shapeOnly)
    if (_shapeOnly) then
        return
    end

    local set = sprite.newSpriteSet(_sheet, _startFrame, _frameCount)
    sprite.add(set, _name, 1, _frameCount, (_frameCount / _frameRate) * msFactor, _loopParam)
    setInfo[_name] = {set = set, xReference = _xReference, yReference = _yReference, spriteSourceSize = {width = _spriteSourceWidth, height = _spriteSourceHeight}, unscaledSpriteRect = {x = _unscaledSpriteX, y = _unscaledSpriteY, width = _unscaledSpriteWidth, height = _unscaledSpriteHeight}, frames = _frames, frameRate = _frameRate, frameCount = _frameCount, fpss = _frameRate / 1000, startFrame = _startFrame}
end

local function load()
    local frameSets = {}
    local allFrames = {}

    frameSets["yellowIdle"] = {
        {
            name="yellowIdle-1",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-2",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-3",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-4",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-5",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-6",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-7",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-8",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-9",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-10",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-11",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-12",
            spriteColorRect={x=0, y=0},
            textureRect={x=66, y=0, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="yellowIdle-13",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-14",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-15",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-16",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-17",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-18",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-19",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-20",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-21",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-22",
            spriteColorRect={x=1, y=0},
            textureRect={x=100, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-23",
            spriteColorRect={x=1, y=0},
            textureRect={x=100, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-24",
            spriteColorRect={x=1, y=0},
            textureRect={x=133, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-25",
            spriteColorRect={x=1, y=0},
            textureRect={x=133, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="yellowIdle-26",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        }
    }
    allFrames = table.copy(allFrames, frameSets["yellowIdle"])

    frameSets["redIdle"] = {
        {
            name="redIdle-1",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-2",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-3",
            spriteColorRect={x=1, y=0},
            textureRect={x=66, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-4",
            spriteColorRect={x=1, y=0},
            textureRect={x=66, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-5",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-6",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-7",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-8",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-9",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-10",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-11",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-12",
            spriteColorRect={x=0, y=0},
            textureRect={x=99, y=58, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="redIdle-13",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-14",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-15",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-16",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-17",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-18",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-19",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-20",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-21",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-22",
            spriteColorRect={x=1, y=0},
            textureRect={x=133, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-23",
            spriteColorRect={x=1, y=0},
            textureRect={x=133, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-24",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-25",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=0, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="redIdle-26",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=58, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        }
    }
    allFrames = table.copy(allFrames, frameSets["redIdle"])

    frameSets["blueIdle"] = {
        {
            name="blueIdle-1",
            spriteColorRect={x=1, y=0},
            textureRect={x=66, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-2",
            spriteColorRect={x=1, y=0},
            textureRect={x=66, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-3",
            spriteColorRect={x=1, y=0},
            textureRect={x=99, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-4",
            spriteColorRect={x=1, y=0},
            textureRect={x=99, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-5",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-6",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-7",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-8",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-9",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-10",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-11",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-12",
            spriteColorRect={x=0, y=0},
            textureRect={x=132, y=116, width=34, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=false,
        },
        {
            name="blueIdle-13",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-14",
            spriteColorRect={x=1, y=0},
            textureRect={x=33, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-15",
            spriteColorRect={x=1, y=0},
            textureRect={x=66, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-16",
            spriteColorRect={x=1, y=0},
            textureRect={x=66, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-17",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-18",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-19",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-20",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-21",
            spriteColorRect={x=1, y=0},
            textureRect={x=0, y=174, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-22",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-23",
            spriteColorRect={x=1, y=0},
            textureRect={x=166, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-24",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-25",
            spriteColorRect={x=1, y=0},
            textureRect={x=199, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        },
        {
            name="blueIdle-26",
            spriteColorRect={x=1, y=0},
            textureRect={x=66, y=116, width=33, height=58},
            spriteSourceSize={width=34, height=58},
            spriteTrimmed=true,
        }
    }
    allFrames = table.copy(allFrames, frameSets["blueIdle"])


    sheet = sprite.newSpriteSheetFromData("royAnimations.png", {frames = allFrames })

    -- setInfo table contains info about sprites: { (spriteName = {set: set, xReference: xReference, yReference: yReference, spriteSourceSize = {width: width, height: height}})+ }
    setInfo = {}
    newSpriteSet(sheet, "yellowIdle", 1, 26, 30, 0, 0 - (34/2 + -4), 0 - (58/2 + -3), 34, 58, 1, 0, 33, 58, frameSets["yellowIdle"], false)
    newSpriteSet(sheet, "redIdle", 27, 26, 30, 0, 0 - (34/2 + -4), 0 - (58/2 + -3), 34, 58, 1, 0, 33, 58, frameSets["redIdle"], false)
    newSpriteSet(sheet, "blueIdle", 53, 26, 30, 0, 0 - (34/2 + -4), 0 - (58/2 + -3), 34, 58, 1, 0, 33, 58, frameSets["blueIdle"], false)

    local shapes = {}
    shapes["yellowIdle"] = {

    }
    shapes["redIdle"] = {

    }
    shapes["blueIdle"] = {

    }

    return { sheet = sheet, setInfo = setInfo, shapes = shapes }
end

local function destroy()
    sheet:dispose()
    sheet = nil
    setInfo = nil
end

return { load = load, destroy = destroy }

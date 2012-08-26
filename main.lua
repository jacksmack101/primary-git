CiderRunMode = {};CiderRunMode.runmode = true;CiderRunMode.assertImage = true;require "CiderDebugger";-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )

system.activate( "multitouch" )

local storyboard = require "storyboard"

local options =
{
    effect = "slideLeft",
    time = 800,
    params = { mapToLoad = "map1" }
    }
 
storyboard.gotoScene( "playMap", options )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):


--require("loq_profiler").createProfiler()
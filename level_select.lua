-----------------------------------------------------------------------------------------
-- level_select.lua
-- Created by: Kalina Dunne Farrell
-- Date: May 23, 2019
-- Description: This is the level select screen of the game.
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)
-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene (buttons will be assigned in the show function)
local bkgImage
local level1Button
local level2Button
local level3Button
local backButton
-----------------------------------------------------------------------------------------
--LOCAL SOUNDS
-----------------------------------------------------------------------------------------
local bkgSound = audio.loadStream("Sounds/bkgs.mp3")
local bkgSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "zoomInOut", time = 500})
end

local function Level1Transition( )       
    composer.gotoScene( "level1_transfer_screen", {effect = "zoomInOut", time = 500})
end 

local function Level2Transition( )       
    composer.gotoScene( "level2_transfer_screen", {effect = "zoomInOut", time = 500})
end 

local function Level3Transition( )       
    composer.gotoScene( "level3_transfer_screen", {effect = "zoomInOut", time = 500})
end 

-------------------------------------------------------------
--Objects
-------------------------------------------------------------
-- Creating Math Button
    level1Button = widget.newButton
        {   
            -- Set its position on the screen relative to the screen size
            x = 150,
            y = 150,
            width = 250,
            height = 250,

            -- Insert the images here
            defaultFile = "Images/MathButtonUnpressed.png",
            overFile = "Images/MathButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1Transition          
        } 

-- Creating art Button
    level2Button = widget.newButton
        {   
            -- Set its position on the screen relative to the screen size
            x = 850,
            y = 150,
            width = 250,
            height = 250,

            -- Insert the images here
            defaultFile = "Images/ArtButtonUnpressed.png",
            overFile = "Images/ArtButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level2Transition          
        } 

-- Creating science Button
    level3Button = widget.newButton
        {   
            -- Set its position on the screen relative to the screen size
            x = 150,
            y = 600,
            width = 250,
            height = 250,

            -- Insert the images here
            defaultFile = "Images/ScienceButtonUnpressed.png",
            overFile = "Images/ScienceButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level3Transition          
        } 

-- creating back button
    backButton = widget.newButton
        {   
            -- Set its position on the screen relative to the screen size
            x = 850,
            y = 600,
            width = 250,
            height = 250,

            -- Insert the images here
            defaultFile = "Images/BackButtonUnpressed.png",
            overFile = "Images/BackButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = BackTransition          
        } 
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level Select Screen.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert(level1Button)
    sceneGroup:insert(level2Button)
    sceneGroup:insert(level3Button)
    sceneGroup:insert(backButton)

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then


    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        bkgSoundChannel = audio.play( bkgSound, {channel=1, loops=-1})
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        lives = 3

    end
end 
-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase
    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        audio.stop(bkgSoundChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------

return scene

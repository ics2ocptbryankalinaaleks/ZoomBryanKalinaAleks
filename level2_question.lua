-----------------------------------------------------------------------------------------
-- level1_screen.lua
-- Created by: Allison
-- Date: May 16, 2017
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limided time to click on the answer
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText

local firstNumber
local secondNumber
local thirdNumber

local answer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3

local answerText 
local wrongAnswerText1
local wrongAnswerText2
local wrongAnswerText3

local answerPosition = 1
local bkg
local cover

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7

local userAnswer
local textTouched = false

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
function BackToLevel1() 
    composer.hideOverlay("crossFade", 400 )
  
    composer.gotoScene( "level2_screen" )
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)
    userAnswer = answerText.text
    
    if (touch.phase == "ended") then

        BackToLevel2()
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    userAnswer = wrongText1.text
    
    if (touch.phase == "ended") then
        
        BackToLevel2()  
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    userAnswer = wrongText2.text
    
    if (touch.phase == "ended") then

        BackToLevel2()
        
    end 
end

local function TouchListenerWrongAnswer3(touch)
    userAnswer = wrongText3.text
    
    if (touch.phase == "ended") then

        BackToLevel2()
        
    end 
end


--adding the event listeners 
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)

end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswer )
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end

-- first question 
local function AskQuestion1()
    -- set the question text
    question1Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question1CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question1CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question1Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question1Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question1Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question1Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question1Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question1Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert(question1Text)
    sceneGroup:insert(question1CorrectAnswer)
    sceneGroup:insert(question1Answer1)
    sceneGroup:insert(question1Answer2)
    sceneGroup:insert(question1Answer3)
end

local function AskQuestion2()
    -- set the question text
    question2Text = display.newText("Which mixture will make brown?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question2CorrectAnswerFirst = display.newText("RED", 0, 0, Arial, textSize)
    question2CorrectAnswerFirst:setTextColor(1, 0, 0)
    question2CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
    question2CorrectAnswerPlus:setTextColor(0, 0, 0)
    question2CorrectAnswerSecond = display.newText("BROWN", 0, 0, Arial, textSize)
    question2CorrectAnswerSecond:setTextColor(102/255, 51/255, 0)

    -- set the first wrong answer text, text color, and position
    question2Answer1First = display.newText("PINK", 0, 0, Arial, textSize)
    question2Answer1First:setTextColor(1, 51/255, 1)
    question2Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question2Answer1Plus:setTextColo(0, 0, 0)
    question2Answer1Second = display.newText("BLUE", 0, 0, Arial, textSize)
    question2Answer1Second:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question2Answer2First = display.newText("ORANGE", 0, 0, Arial, textSize)
    question2Answer2First:setTextColor(1, 128/255, 0)
    question2Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question2Answer2Plus:setTextColor(0, 0, 0)
    question2Answer2Second = display.newText("PURPLE", 0, 0, Arial, textSize)
    question2Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question2Answer3First = display.newText("YELLOW", 0, 0, Arial, textSize) 
    question2Answer3First:setTextColor(1, 1, 0)
    question2Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question2Answer3Plus:setTextColor(0, 0, 0)
    question2Answer3Second = display.newText("GREEN", 0, 0, Arial, textSize)
    question2Answer3Second:setTextColor(0, 1, 0)

    sceneGroup:insert(question2CorrectAnswerFirst)
    sceneGroup:insert(question2CorrectAnswerPlus)
    sceneGroup:insert(question2CorrectAnswerSecond)
    sceneGroup:insert(question2Answer1First)
    sceneGroup:insert(question2Answer1Plus)
    sceneGroup:insert(question2Answer1Second)
    sceneGroup:insert(question2Answer2First)
    sceneGroup:insert(question2Answer2Plus)
    sceneGroup:insert(question2Answer2Second)
    sceneGroup:insert(question2Answer3First)
    sceneGroup:insert(question2Answer3Plus)
    sceneGroup:insert(question2Answer3Second)
end

local function AskQuestion3()
    -- set the question text
    question3Text = display.newText("Which color is the opposite of orange?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question3CorrectAnswer = display.newText("BLUE", 0, 0, Arial, textSize)
    question3CorrectAnswer:setTextColor(0, 0, 1)

    -- set the first wrong answer text, text color, and position
    question3Answer1 = display.newText("RED", 0, 0, Arial, textSize)
    question3Answer1:setTextColor(1, 0, 0)

    -- set the second wrong answer text, text color, and position
    question3Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question3Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question3Answer3 = display.newText("GREEN", 0, 0, Arial, textSize)
    question3Answer3:setTextColor(0, 1, 0)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion4()
    -- set the question text
    question4Text = display.newText("Which color is the opposite of purple?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question4CorrectAnswer = display.newText("BLACK", 0, 0, Arial, textSize)
    question4CorrectAnswer:setTextColor(0, 0, 0)

    -- set the first wrong answer text, text color, and position
    question4Answer1 = display.newText("RED", 0, 0, Arial, textSize)
    question4Answer1:setTextColor(1, 0, 0)

    -- set the second wrong answer text, text color, and position
    question4Answer2 = display.newText("BLUE", 0, 0, Arial, textSize)
    question4Answer2:setTextColor(0, 0, 1)

    -- set the third wrong answer text, text color, and position
    question4Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question4Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion5()
    -- set the question text
    question5Text = display.newText("Which mixture will create green?", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question5CorrectAnswerFirst = display.newText("", 0, 0, Arial, textSize)
    question5CorrectAnswerFirst:setTextColor(1, 0, 0)
    question5CorrectAnswerPlus = display.newText("", 0, 0, Arial, textSize)
    question5CorrectAnswerPlus:setTextColor(0, 0, 0)
    question5CorrectAnswerSecond = display.newText("", 0, 0, Arial, textSize)
    question5CorrectAnswerSecond:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question5Answer1First = display.newText("", 0, 0, Arial, textSize)
    question5Answer1First:setTextColor(0, 1, 0)
    question5Answer1Plus = display.newText("", 0, 0, Arial, textSize)
    question5Answer1Plus:setTextColor(0, 0, 0)
    question5Answer1Second = display.newText("", 0, 0, Arial, textSize)
    question5Answer1Second:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question5Answer2First = display.newText("", 0, 0, Arial, textSize)
    question5Answer2First:setTextColor(127/255, 0, 1)
    question5Answer2Plus = display.newText("", 0, 0, Arial, textSize)
    question5Answer2Plus:setTextColor(0, 0, 0)
    question5Answer2Second = display.newText("", 0, 0, Arial, textSize)
    question5Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question5Answer3First = display.newText("", 0, 0, Arial, textSize)
    question5Answer3First:setTextColor(1, 51/255, 1)
    question5Answer3Plus = display.newText("", 0, 0, Arial, textSize)
    question5Answer3Plus:setTextColor(0, 0, 0)
    question5Answer3Second = display.newText("", 0, 0, Arial, textSize)
    question5Answer3Second:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion6()
    -- set the question text
    question6Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question6CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question6CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question6Answer1 = display.newText("", 0, 0, Arial, textSize)
    question6Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question6Answer2 = display.newText("", 0, 0, Arial, textSize)
    question6Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question6Answer3 = display.newText("", 0, 0, Arial, textSize)
    question6Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end
 
local function AskQuestion7()
    -- set the question text
    question7Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question7CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question7CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question7Answer1 = display.newText("", 0, 0, Arial, textSize)
    question7Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question7Answer2 = display.newText("", 0, 0, Arial, textSize)
    question7Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question7Answer3 = display.newText("", 0, 0, Arial, textSize)
    question7Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion8()
    -- set the question text
    question8Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question8CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question8CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question8Answer1 = display.newText("", 0, 0, Arial, textSize)
    question8Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question8Answer2 = display.newText("", 0, 0, Arial, textSize)
    question8Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question8Answer3 = display.newText("", 0, 0, Arial, textSize)
    question8Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion9()
    -- set the question text
    question9Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question9CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question9CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question9Answer1 = display.newText("", 0, 0, Arial, textSize)
    question9Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question9Answer2 = display.newText("", 0, 0, Arial, textSize)
    question9Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question9Answer3 = display.newText("", 0, 0, Arial, textSize)
    question9Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion10()
    -- set the question text
    question10Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question10CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question10CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question10Answer1 = display.newText("", 0, 0, Arial, textSize)
    question10Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question10Answer2 = display.newText("", 0, 0, Arial, textSize)
    question10Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, 2text color, and position
    question10Answer3 = display.newText("", 0, 0, Arial, textSize)
    question10Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion11()
    -- set the question text
    question11Text = display.newText("Click on the Primary Color", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question11CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question11CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question11Answer1 = display.newText("GREEN", 0, 0, Arial, textSize)
    question11Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question11Answer2 = display.newText("PURPLE", 0, 0, Arial, textSize)
    question11Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question11Answer3 = display.newText("PINK", 0, 0, Arial, textSize)
    question11Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion12()
    -- set the question text
    question12Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question12CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question12CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question12Answer1 = display.newText("", 0, 0, Arial, textSize)
    question12Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question12Answer2 = display.newText("", 0, 0, Arial, textSize)
    question12Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question12Answer3 = display.newText("", 0, 0, Arial, textSize)
    question12Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion13()
    -- set the question text
    question13Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question13CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question13CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question13Answer1 = display.newText("", 0, 0, Arial, textSize)
    question13Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question13Answer2 = display.newText("", 0, 0, Arial, textSize)
    question13Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question13Answer3 = display.newText("", 0, 0, Arial, textSize)
    question13Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion14()
    -- set the question text
    question14Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question14CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question14CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question14Answer1 = display.newText("", 0, 0, Arial, textSize)
    question14Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question14Answer2 = display.newText("", 0, 0, Arial, textSize)
    question14Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question14Answer3 = display.newText("", 0, 0, Arial, textSize)
    question14Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion15()
    -- set the question text
    question15Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question15CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question15CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question15Answer1 = display.newText("", 0, 0, Arial, textSize)
    question15Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question15Answer2 = display.newText("", 0, 0, Arial, textSize)
    question15Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question15Answer3 = display.newText("", 0, 0, Arial, textSize)
    question15Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion16()
    -- set the question text
    question16Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question16CorrectAnswerFirst = display.newText("WHITE", 0, 0, Arial, textSize)
    question16CorrectAnswerFirst:setTextColor(1, 0, 0)
    question16CorrectAnswerPlus = display.newText(" + ", 0, 0, Arial, textSize)
    question16CorrectAnswerPlus:setTextColor(0, 0, 0)
    question16CorrectAnswer = display.newText("RED", 0, 0, Arial, textSize)
    question16CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question16Answer1First = display.newText("RED", 0, 0, Arial, textSize)
    question16Answer1First:setTextColor(1, 0, 0)
    question16Answer1Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer1Plus:setTextColor(0, 0, 0)
    question16Answer1Second = display.newText("BLUE", 0, 0, Arial, textSize)
    question16Answer1Second:setTextColor(0, 0, 1)

    -- set the second wrong answer text, text color, and position
    question16Answer2First = display.newText("ORANGE", 0, 0, Arial, textSize)
    question16Answer2First:setTextColor(127/255, 0, 1)
    question16Answer2Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer2Plus:setTextColor(0, 0, 0)
    question16Answer2Second = display.newText("GREEN", 0, 0, Arial, textSize)
    question16Answer2Second:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question16Answer3First = display.newText("YELLOW", 0, 0, Arial, textSize)
    question16Answer3First:setTextColor(1, 51/255, 1)
    question16Answer3Plus = display.newText(" + ", 0, 0, Arial, textSize)
    question16Answer3Plus:setTextColor(0, 0, 0)
    question16Answer3Second = display.newText("PURPLE", 0, 0, Arial, textSize)
    question16Answer3Second:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion17()
    -- set the question text
    question17Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question17CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question17CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question17Answer1 = display.newText("", 0, 0, Arial, textSize)
    question17Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question17Answer2 = display.newText("", 0, 0, Arial, textSize)
    question17Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question17Answer3 = display.newText("", 0, 0, Arial, textSize)
    question17Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion18()
    -- set the question text
    question18Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question18CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question18CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question18Answer1 = display.newText("", 0, 0, Arial, textSize)
    question18Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question18Answer2 = display.newText("", 0, 0, Arial, textSize)
    question18Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question18Answer3 = display.newText("", 0, 0, Arial, textSize)
    question18Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion19()
    -- set the question text
    question19Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question19CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question19CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question19Answer1 = display.newText("", 0, 0, Arial, textSize)
    question19Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question19Answer2 = display.newText("", 0, 0, Arial, textSize)
    question19Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question19Answer3 = display.newText("", 0, 0, Arial, textSize)
    question19Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

local function AskQuestion20()
    -- set the question text
    question20Text = display.newText("", 0, 0, Arial, textSize)

    -- set the correct answer text, text color, and position
    question20CorrectAnswer = display.newText("", 0, 0, Arial, textSize)
    question20CorrectAnswer:setTextColor(1, 0, 0)

    -- set the first wrong answer text, text color, and position
    question20Answer1 = display.newText("", 0, 0, Arial, textSize)
    question20Answer1:setTextColor(0, 1, 0)

    -- set the second wrong answer text, text color, and position
    question20Answer2 = display.newText("", 0, 0, Arial, textSize)
    question20Answer2:setTextColor(127/255, 0, 1)

    -- set the third wrong answer text, text color, and position
    question20Answer3 = display.newText("", 0, 0, Arial, textSize)
    question20Answer3:setTextColor(1, 51/255, 1)

    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
    sceneGroup:insert()
end

-- ask a question
function AskQuestion()
    -- choose out of the possoble 20 questions
    questionNumber = math.random(1, 20)

    -- based on the questionNumber, call the function that will create that question. They are seperate because there was too
    --many lines of code in a single function if theye ere all together - there was an error because of it
    if (questionNumber == 1) then
        AskQuestion1()

    elseif (questionNumber == 2) then
        AskQuestion2()

    elseif (questionNumber == 3) then
        AskQuestion3()

    elseif (questionNumber == 4) then
        AskQuestion4()

    elseif (questionNumber == 5) then
        AskQuestion5()

    elseif (questionNumber == 6) then
        AskQuestion6()

    elseif (questionNumber == 7) then
        AskQuestion7()

    elseif (questionNumber == 8) then
        AskQuestion8()

    elseif (questionNumber == 9) then
        AskQuestion9()

    elseif (questionNumber == 10) then
        AskQuestion10()

    elseif (questionNumber == 11) then
        AskQuestion11()

    elseif (questionNumber == 12) then
        AskQuestion12()

    elseif (questionNumber == 13) then
        AskQuestion13()

    elseif (questionNumber == 14) then
        AskQuestion14()

    elseif (questionNumber == 15) then
        AskQuestion15()

    elseif (questionNumber == 16) then
        AskQuestion16()

    elseif (questionNumber == 17) then
        AskQuestion17()

    elseif (questionNumber == 18) then
        AskQuestion18()

    elseif (questionNumber == 19) then
        AskQuestion19()

    elseif (questionNumber == 20) then
        AskQuestion20()

    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 75)  

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()
        PositionAnswers()
        AddTextListeners()
    end

end --function scene:show( event )

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
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
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
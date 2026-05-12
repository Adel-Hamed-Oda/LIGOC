---@diagnostic disable: undefined-global
local Button = require("src.ui.Button")

local TitleScene = {}
TitleScene.__index = TitleScene

function TitleScene.new()
    return setmetatable({
        startButton = nil
    }, TitleScene)
end

function TitleScene:load()
    local GameScene = require("src.scenes.GameScene")
    self.startButton = Button.new(640,360,180,48,"Start", function()
        if self.manager then self.manager:setScene(GameScene.new()) end
    end)
end

function TitleScene:update(dt)
end

function TitleScene:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.print("Logic Gates - Title", 520, 200)
    if self.startButton then self.startButton:draw() end
end

function TitleScene:mousepressed(x,y,button)
    if self.startButton then self.startButton:mousepressed(x,y,button) end
end

function TitleScene:keypressed(key)
end

return TitleScene

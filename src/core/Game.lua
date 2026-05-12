local SceneManager = require("src.core.SceneManager")
local TitleScene = require("src.scenes.TitleScene")

local Game = {}
Game.__index = Game

function Game.new()
    return setmetatable({
        sceneManager = SceneManager.new()
    }, Game)
end

function Game:load()
    self.sceneManager:setScene(TitleScene.new())
end

function Game:update(dt)
    self.sceneManager:update(dt)
end

function Game:draw()
    self.sceneManager:draw()
end

function Game:keypressed(key)
    self.sceneManager:keypressed(key)
end

function Game:mousepressed(x,y,button)
    self.sceneManager:mousepressed(x,y,button)
end

return Game

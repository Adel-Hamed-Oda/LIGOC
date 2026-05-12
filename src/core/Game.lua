local SceneManager = require("src.core.SceneManager")
local GameScene = require("src.scenes.GameScene")

local Game = {}
Game.__index = Game

function Game.new()
    return setmetatable({
        sceneManager = SceneManager.new()
    }, Game)
end

function Game:load()
    self.sceneManager:setScene(GameScene.new())
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

return Game

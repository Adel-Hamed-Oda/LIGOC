local Circuit = require("src.circuit.Circuit")

local GameScene = {}
GameScene.__index = GameScene

function GameScene.new()
    return setmetatable({
        circuit = Circuit.new()
    }, GameScene)
end

function GameScene:load()
end

function GameScene:update(dt)
    self.circuit:update(dt)
end

function GameScene:draw()
    self.circuit:draw()
end

function GameScene:keypressed(key)
end

return GameScene

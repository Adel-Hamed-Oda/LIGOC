local Circuit = require("src.circuit.Circuit")
local Button = require("src.ui.Button")

local GameScene = {}
GameScene.__index = GameScene

function GameScene.new()
    return setmetatable({
        circuit = Circuit.new(),
        buttons = {}
    }, GameScene)
end

function GameScene:load()
    local Test_AND = require("src.scenes.testing.Test_AND")
    local Test_OR = require("src.scenes.testing.Test_OR")
    local Test_XOR = require("src.scenes.testing.Test_XOR")
    local Test_NAND = require("src.scenes.testing.Test_NAND")

    table.insert(self.buttons, Button.new(200,40,140,34,"Test AND", function()
        if self.manager then self.manager:setScene(Test_AND.new()) end
    end))
    table.insert(self.buttons, Button.new(360,40,140,34,"Test OR", function()
        if self.manager then self.manager:setScene(Test_OR.new()) end
    end))
    table.insert(self.buttons, Button.new(520,40,140,34,"Test XOR", function()
        if self.manager then self.manager:setScene(Test_XOR.new()) end
    end))
    table.insert(self.buttons, Button.new(680,40,140,34,"Test NAND", function()
        if self.manager then self.manager:setScene(Test_NAND.new()) end
    end))
end

function GameScene:update(dt)
    self.circuit:update(dt)
end

function GameScene:draw()
    self.circuit:draw()
    for _,b in ipairs(self.buttons) do b:draw() end
end

function GameScene:mousepressed(x,y,button)
    for _,b in ipairs(self.buttons) do b:mousepressed(x,y,button) end
end

function GameScene:keypressed(key)
end

return GameScene

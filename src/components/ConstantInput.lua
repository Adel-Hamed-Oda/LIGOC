---@diagnostic disable: undefined-global
local Node = require("src.circuit.Node")
---@diagnostic disable: duplicate-set-field
local ConstantInput = {}
ConstantInput.__index = ConstantInput

function ConstantInput.new(x, y, value)
    local self = setmetatable({
        x = x or 0,
        y = y or 0,
        w = 30,
        h = 30,
        value = value and true or false,
        outputNode = nil
    }, ConstantInput)

    self.outputNode = Node.new(self, self.w/2, 0, true, 1)
    self.outputNode.signal = self.value
    return self
end

function ConstantInput:update(dt)
    self.outputNode.signal = self.value
end

function ConstantInput:draw()
    if self.value then love.graphics.setColor(1,0,0) else love.graphics.setColor(0.6,0.6,0.6) end
    love.graphics.rectangle("fill", self.x - self.w/2, self.y - self.h/2, self.w, self.h)
    local ox,oy = self.outputNode:getPos()
    if self.outputNode.signal then love.graphics.setColor(1,0,0) else love.graphics.setColor(1,1,1) end
    love.graphics.circle("fill", ox, oy, 6)
    love.graphics.setColor(1,1,1)
end

return ConstantInput

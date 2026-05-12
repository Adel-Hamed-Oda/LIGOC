---@diagnostic disable: undefined-global
local Node = require("src.circuit.Node")

local Gate = {}
Gate.__index = Gate

function Gate.new(x, y, numInputs, color)
    local self = setmetatable({
        x = x or 0,
        y = y or 0,
        w = 60,
        h = 40,
        numInputs = numInputs or 2,
        color = color or {0.7,0.7,0.7},
        inputNodes = {},
        outputNode = nil
    }, Gate)

    local gap = 0
    if self.numInputs > 1 then
        gap = self.h / (self.numInputs + 1)
    end

    for i=1,self.numInputs do
        local oy = -self.h/2 + i * gap
        table.insert(self.inputNodes, Node.new(self, -self.w/2, oy, false, i))
    end

    self.outputNode = Node.new(self, self.w/2, 0, true, 1)

    return self
end

function Gate:getInputValue(index)
    local node = self.inputNodes[index]
    if node then return node.signal end
    return false
end

function Gate:getOutput()
    if self.outputNode then return self.outputNode.signal end
    return false
end

function Gate:setOutput(value)
    if self.outputNode then self.outputNode:setOutput(value) end
end

function Gate:update(dt)
    self:evaluate()
end

function Gate:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x - self.w/2, self.y - self.h/2, self.w, self.h)
    -- draw nodes
    for _,n in ipairs(self.inputNodes) do
        local nx,ny = n:getPos()
        if n.signal then love.graphics.setColor(1,0,0) else love.graphics.setColor(1,1,1) end
        love.graphics.circle("fill", nx, ny, 6)
    end

    local ox,oy = self.outputNode:getPos()
    if self.outputNode.signal then love.graphics.setColor(1,0,0) else love.graphics.setColor(1,1,1) end
    love.graphics.circle("fill", ox, oy, 6)
    love.graphics.setColor(1,1,1)
end

return Gate

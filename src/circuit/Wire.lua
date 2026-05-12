---@diagnostic disable: undefined-global
local Wire = {}
Wire.__index = Wire

function Wire.new(outputNode, inputNode)
    return setmetatable({
        outputNode = outputNode,
        inputNode = inputNode,
        signal = false
    }, Wire)
end

function Wire:update(dt)
    if self.outputNode and self.outputNode.getOutput then
        self.signal = self.outputNode:getOutput()
    end

    if self.inputNode and self.inputNode.setInput then
        self.inputNode:setInput(self.signal)
    end
end

function Wire:draw()
    local x1,y1 = self.outputNode:getPos()
    local x2,y2 = self.inputNode:getPos()
    if self.signal then
        love.graphics.setColor(1,0,0)
    else
        love.graphics.setColor(1,1,1)
    end
    love.graphics.setLineWidth(3)
    love.graphics.line(x1,y1,x2,y2)
    love.graphics.setColor(1,1,1)
end

return Wire

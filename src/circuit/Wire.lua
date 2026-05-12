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
end

return Wire

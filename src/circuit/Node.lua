local Node = {}
Node.__index = Node

function Node.new(owner, ox, oy, isOutput, index)
    return setmetatable({
        owner = owner,
        ox = ox or 0,
        oy = oy or 0,
        isOutput = isOutput and true or false,
        index = index,
        signal = false
    }, Node)
end

function Node:getPos()
    if self.owner then
        return self.owner.x + self.ox, self.owner.y + self.oy
    end
    return self.ox, self.oy
end

function Node:setInput(value)
    if not self.isOutput then
        self.signal = value and true or false
    end
end

function Node:getOutput()
    return self.signal
end

function Node:setOutput(value)
    if self.isOutput then
        self.signal = value and true or false
    end
end

return Node

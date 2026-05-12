local Gate = {}
Gate.__index = Gate

function Gate.new(x, y)
    return setmetatable({
        x = x or 0,
        y = y or 0,
        inputs = {},
        output = false
    }, Gate)
end

function Gate:setInput(index, value)
    self.inputs[index] = value and true or false
end

function Gate:getOutput()
    return self.output
end

function Gate:evaluate()
    self.output = false
end

function Gate:update(dt)
    self:evaluate()
end

function Gate:draw()
end

return Gate

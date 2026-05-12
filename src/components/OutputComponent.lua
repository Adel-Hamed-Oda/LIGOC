---@diagnostic disable: undefined-global
local Node = require("src.circuit.Node")

---@diagnostic disable: duplicate-set-field
local OutputComponent = {}
OutputComponent.__index = OutputComponent

function OutputComponent.new(x, y)
    local self = setmetatable({
        x = x or 0,
        y = y or 0,
        r = 12,
        inputNode = nil,
        state = false
    }, OutputComponent)

    self.inputNode = Node.new(self, -20, 0, false, 1)
    return self
end

function OutputComponent:update(dt)
    if self.inputNode then self.state = self.inputNode.signal end
end

function OutputComponent:draw()
    if self.state then love.graphics.setColor(1,0,0) else love.graphics.setColor(1,1,1) end
    love.graphics.circle("fill", self.x, self.y, self.r)
    love.graphics.setColor(1,1,1)
end

return OutputComponent

---@diagnostic disable: duplicate-set-field
local Gate = require("src.components.gates.Gate")

local XorGate = setmetatable({}, { __index = Gate })
XorGate.__index = XorGate

function XorGate.new(x, y)
    local self = setmetatable(Gate.new(x, y, 2, {0.7,0.2,0.9}), XorGate)
    return self
end

function XorGate:evaluate()
    local a = self:getInputValue(1)
    local b = self:getInputValue(2)
    self:setOutput((a and not b) or (b and not a))
end

return XorGate

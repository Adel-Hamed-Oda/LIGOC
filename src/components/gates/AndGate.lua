---@diagnostic disable: duplicate-set-field
local Gate = require("src.components.gates.Gate")

local AndGate = setmetatable({}, { __index = Gate })
AndGate.__index = AndGate

function AndGate.new(x, y)
    local self = setmetatable(Gate.new(x, y, 2, {0.2,0.8,0.2}), AndGate)
    return self
end

function AndGate:evaluate()
    local a = self:getInputValue(1)
    local b = self:getInputValue(2)
    self:setOutput(a and b)
end

return AndGate

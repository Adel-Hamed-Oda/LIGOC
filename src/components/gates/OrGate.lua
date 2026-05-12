---@diagnostic disable: duplicate-set-field
local Gate = require("src.components.gates.Gate")

local OrGate = setmetatable({}, { __index = Gate })
OrGate.__index = OrGate

function OrGate.new(x, y)
    local self = setmetatable(Gate.new(x, y, 2, {0.2,0.4,0.9}), OrGate)
    return self
end

function OrGate:evaluate()
    local a = self:getInputValue(1)
    local b = self:getInputValue(2)
    self:setOutput(a or b)
end

return OrGate

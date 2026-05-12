---@diagnostic disable: duplicate-set-field
local Gate = require("src.components.gates.Gate")

local NandGate = setmetatable({}, { __index = Gate })
NandGate.__index = NandGate

function NandGate.new(x, y)
    local self = setmetatable(Gate.new(x, y, 2, {1,0.6,0}), NandGate)
    return self
end

function NandGate:evaluate()
    local a = self:getInputValue(1)
    local b = self:getInputValue(2)
    local out = not (a and b)
    self:setOutput(out)
end

return NandGate

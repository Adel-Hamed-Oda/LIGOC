---@diagnostic disable: duplicate-set-field
local Gate = require("src.components.gates.Gate")

local NotGate = setmetatable({}, { __index = Gate })
NotGate.__index = NotGate

function NotGate.new(x, y)
    local self = setmetatable(Gate.new(x, y, 1, {0.9,0.9,0.2}), NotGate)
    return self
end

function NotGate:evaluate()
    local a = self:getInputValue(1)
    self:setOutput(not a)
end

return NotGate

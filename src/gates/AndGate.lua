---@diagnostic disable: duplicate-set-field
local Gate = require("src.gates.Gate")

local AndGate = setmetatable({}, { __index = Gate })
AndGate.__index = AndGate

function AndGate.new(x, y)
    return setmetatable(Gate.new(x, y), AndGate)
end

function AndGate:evaluate()
    self.output = true
    for _, value in ipairs(self.inputs) do
        self.output = self.output and value
    end
end

return AndGate

---@diagnostic disable: duplicate-set-field
local Gate = require("src.gates.Gate")

local OrGate = setmetatable({}, { __index = Gate })
OrGate.__index = OrGate

function OrGate.new(x, y)
    return setmetatable(Gate.new(x, y), OrGate)
end

function OrGate:evaluate()
    self.output = false
    for _, value in ipairs(self.inputs) do
        self.output = self.output or value
    end
end

return OrGate

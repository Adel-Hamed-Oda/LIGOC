---@diagnostic disable: duplicate-set-field
local Gate = require("src.gates.Gate")

local XorGate = setmetatable({}, { __index = Gate })
XorGate.__index = XorGate

function XorGate.new(x, y)
    return setmetatable(Gate.new(x, y), XorGate)
end

function XorGate:evaluate()
    local activeInputs = 0
    for _, value in ipairs(self.inputs) do
        if value then
            activeInputs = activeInputs + 1
        end
    end

    self.output = activeInputs % 2 == 1
end

return XorGate

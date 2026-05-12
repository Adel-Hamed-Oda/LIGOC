---@diagnostic disable: duplicate-set-field
local Gate = require("src.gates.Gate")

local NotGate = setmetatable({}, { __index = Gate })
NotGate.__index = NotGate

function NotGate.new(x, y)
    return setmetatable(Gate.new(x, y), NotGate)
end

function NotGate:evaluate()
    self.output = not (self.inputs[1] and true or false)
end

return NotGate

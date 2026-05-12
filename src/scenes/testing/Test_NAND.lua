local Circuit = require("src.circuit.Circuit")
local NandGate = require("src.components.gates.NandGate")
local ConstantInput = require("src.components.ConstantInput")
local OutputComp = require("src.components.OutputComponent")
local Wire = require("src.circuit.Wire")
local Button = require("src.ui.Button") 

local TestScene = {}
TestScene.__index = TestScene

function TestScene.new()
    local self = setmetatable({
        circuit = Circuit.new()
    }, TestScene)

    local startX = 200
    local startY = 120
    local gapY = 120

    local combos = { {0,0},{0,1},{1,0},{1,1} }

    for i,combo in ipairs(combos) do
        local y = startY + (i-1)*gapY
        local a = ConstantInput.new(startX, y, combo[1]==1)
        local b = ConstantInput.new(startX, y+30, combo[2]==1)
        local gate = NandGate.new(startX+180, y+15)
        local out = OutputComp.new(startX+340, y+15)
        self.circuit:addGate(a)
        self.circuit:addGate(b)
        self.circuit:addGate(gate)
        self.circuit:addGate(out)

        table.insert(self.circuit.wires, Wire.new(a.outputNode, gate.inputNodes[1]))
        table.insert(self.circuit.wires, Wire.new(b.outputNode, gate.inputNodes[2]))
        table.insert(self.circuit.wires, Wire.new(gate.outputNode, out.inputNode))
    end

    self.back = Button.new(980,40,140,34,"Back", function()
        if self.manager then self.manager:setScene(require("src.scenes.GameScene").new()) end
    end)

    return self
end

function TestScene:load() end
function TestScene:update(dt) self.circuit:update(dt) end
function TestScene:draw()
    self.circuit:draw()
    if self.back then self.back:draw() end
end

function TestScene:mousepressed(x,y,button)
    if self.back then self.back:mousepressed(x,y,button) end
end

return TestScene

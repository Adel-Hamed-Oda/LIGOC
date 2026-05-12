local Circuit = {}
Circuit.__index = Circuit

function Circuit.new()
    return setmetatable({
        gates = {},
        wires = {}
    }, Circuit)
end

function Circuit:addGate(gate)
    table.insert(self.gates, gate)
    return gate
end

function Circuit:addWire(wire)
    table.insert(self.wires, wire)
    return wire
end

function Circuit:update(dt)
    for _, gate in ipairs(self.gates) do
        if gate.update then
            gate:update(dt)
        end
    end

    for _, wire in ipairs(self.wires) do
        if wire.update then
            wire:update(dt)
        end
    end
end

function Circuit:draw()
    for _, wire in ipairs(self.wires) do
        if wire.draw then
            wire:draw()
        end
    end

    for _, gate in ipairs(self.gates) do
        if gate.draw then
            gate:draw()
        end
    end
end

return Circuit

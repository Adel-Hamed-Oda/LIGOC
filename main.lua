---@diagnostic disable: undefined-global
local Game = require("src.core.Game")

local game = Game.new()

function love.load()
    game:load()
end

function love.update(dt)
    game:update(dt)
end

function love.draw()
    game:draw()
end

function love.keypressed(key)
    if game.keypressed then
        game:keypressed(key)
    end
end

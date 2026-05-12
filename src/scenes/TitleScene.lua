local TitleScene = {}
TitleScene.__index = TitleScene

function TitleScene.new()
    return setmetatable({}, TitleScene)
end

function TitleScene:load()
end

function TitleScene:update(dt)
end

function TitleScene:draw()
end

function TitleScene:keypressed(key)
end

return TitleScene

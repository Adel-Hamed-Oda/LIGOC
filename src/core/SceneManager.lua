local SceneManager = {}
SceneManager.__index = SceneManager

function SceneManager.new()
    return setmetatable({
        currentScene = nil
    }, SceneManager)
end

function SceneManager:setScene(scene)
    self.currentScene = scene
    if self.currentScene then
        self.currentScene.manager = self
    end
    if self.currentScene and self.currentScene.load then
        self.currentScene:load()
    end
end

function SceneManager:update(dt)
    if self.currentScene and self.currentScene.update then
        self.currentScene:update(dt)
    end
end

function SceneManager:draw()
    if self.currentScene and self.currentScene.draw then
        self.currentScene:draw()
    end
end

function SceneManager:keypressed(key)
    if self.currentScene and self.currentScene.keypressed then
        self.currentScene:keypressed(key)
    end
end

function SceneManager:mousepressed(x,y,button)
    if self.currentScene and self.currentScene.mousepressed then
        self.currentScene:mousepressed(x,y,button)
    end
end

return SceneManager

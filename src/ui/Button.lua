---@diagnostic disable: undefined-global
local Button = {}
Button.__index = Button

function Button.new(x,y,w,h,text,onClick)
    return setmetatable({
        x = x or 0,
        y = y or 0,
        w = w or 120,
        h = h or 36,
        text = text or "",
        onClick = onClick
    }, Button)
end

function Button:draw()
    love.graphics.setColor(0.2,0.2,0.2)
    love.graphics.rectangle("fill", self.x - self.w/2, self.y - self.h/2, self.w, self.h, 4,4)
    love.graphics.setColor(1,1,1)
    local font = love.graphics.getFont()
    local tw = font and font:getWidth(self.text) or 0
    local th = font and font:getHeight() or 0
    love.graphics.print(self.text, self.x - tw/2, self.y - th/2)
end

function Button:mousepressed(mx,my,button)
    if mx >= self.x - self.w/2 and mx <= self.x + self.w/2 and my >= self.y - self.h/2 and my <= self.y + self.h/2 then
        if self.onClick then self.onClick() end
    end
end

return Button

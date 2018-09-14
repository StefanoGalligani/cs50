Powerup = Class{}

function Powerup:init(x, y)
    -- used for coloring and score calculation
    self.skin = 9
    
    self.x = x
    self.y = y
    self.width = 16
    self.height = 16
    
    -- used to determine whether this brick should be rendered
    self.inPlay = false
    self.yspeed = 40
end

function Powerup:spawn(x, y, skin)
    self.x = x
    self.y = y
    self.inPlay = true
    self.skin = skin
end

function Powerup:update(dt)
    if self.inPlay then
        self.y = self.y + self.yspeed * dt
    end

    if self.y > VIRTUAL_HEIGHT then
        self.inPlay = false
    end
end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 
    return true
end

function Powerup:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'],
            gFrames['powerup'][self.skin],
            self.x, self.y)
    end
end
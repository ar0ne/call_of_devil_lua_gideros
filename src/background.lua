Background = Background or Core.class(Sprite)

--[[
	level 

--]]

function Background:init(options)
	
	local level = options.level
	
	local bg = Bitmap.new(Texture.new("assets/images/background.png"))
	bg:setAnchorPoint(0.5, 0.5)
	bg:setScale(2 * 1.2, 2)
	bg:setPosition(level.level_width/2, level.level_height/2)
	
	self:addChild(bg)
	
end
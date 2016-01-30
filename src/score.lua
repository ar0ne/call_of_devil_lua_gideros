Score = Score or Core.class(Sprite)

function Score:init(options)

	self.level = options.level
	self.count = options.count or 0
	
	self.font = TTFont.new("assets/fonts/Amatic-Bold.ttf", conf.FONT_SIZE)
	
	self:drawCount()

	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)

end

function Score:onEnterFrame()
	
	
end


function Score:drawCount(count)
	if self.text then
		self:removeChild(self.text)
	end
		
	self.text = TextField.new(self.font, self.count)
	self.text:setTextColor(conf.SCORE_FONT_COLOR_HEX)
	
	self.text:setPosition(self.level.level_width / 2, 50)
	self:addChild(self.text)
end

function Score:incrementCount()

	self.count = self.count + 1
	self:drawCount()
	
end
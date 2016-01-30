LevelScene = LevelScene or Core.class(Sprite)

function LevelScene:init(options)

	self.level_height 	= conf.HEIGHT
	self.level_width 	= conf.WIDTH

	self.background = Background.new {
		level = self,
	}
	
	self.church = Church.new {
		level = self,
	}
	
	self.pentagrama = Pentagram.new {
		level = self,
	}
	
	
	self:addChild(self.background)
	self:addChild(self.church)
	self:addChild(self.pentagrama)
	


	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)

end


function LevelScene:onEnterFrame()
	
end


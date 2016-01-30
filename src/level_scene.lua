LevelScene = LevelScene or Core.class(Sprite)

function LevelScene:init(options)

	self.level_height 	= conf.HEIGHT
	self.level_width 	= conf.WIDTH
	self.paused 		= false

	self.background = Background.new {
		level = self,
	}
		
	self.pentagram = Pentagram.new {
		level = self,
	}
	
	self.score = Score.new {
		level = self,
		count = 0,
	}
	
	self.moon = Moon.new {
		level = self,
	}
	
	
	self:addChild(self.background)
	
	self:addChild(self.pentagram)
	self:addChild(self.moon)
	
	
	self:addChild(self.score)
	


	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	self:addEventListener(Event.MOUSE_DOWN, self.onMouseDown, self)

end


function LevelScene:onEnterFrame()
	
end

function LevelScene:onMouseDown(event)
    
    if not self.paused then
        event:stopPropagation()

		self.score:incrementCount()
		
		if self.score.count == 10 then
			self.pentagram:openDoor()
		end
    end
    
end


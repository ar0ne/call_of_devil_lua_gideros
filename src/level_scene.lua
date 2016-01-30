LevelScene = LevelScene or Core.class(Sprite)

function LevelScene:init(options)

	self.level_height 	= conf.HEIGHT
	self.level_width 	= conf.WIDTH
	self.paused 		= false

	self.background = Background.new {
		level = self,
	}
	
	self.church = Church.new {
		level = self,
	}
	
	self.pentagrama = Pentagram.new {
		level = self,
	}
	
	self.score = Score.new {
		level = self,
		count = 0,
	}
	
	
	--self:addChild(self.background)
	
	self:addChild(self.church)
	self:addChild(self.pentagrama)
	
	
	
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
    end
    
end


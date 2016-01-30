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
	
	
	self.devil = Devil.new {
		level = self,
	}
	
	self:addChild(self.background)
	
	self:addChild(self.pentagram)
	self:addChild(self.moon)
	
	self:addChild(self.devil)
	
	
	self:addChild(self.score)
	


	self:addEventListener(Event.KEY_DOWN, self.onKeyDown, self)
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	self:addEventListener(Event.MOUSE_DOWN, self.onMouseDown, self)

end


function LevelScene:onEnterFrame()
	
end

function LevelScene:onMouseDown(event)
    
    if not self.paused then
        event:stopPropagation()

		self.score:incrementCount()
		
		self.devil:callDevil()
		
		if self.score.count == 10 then
			self.pentagram:openDoor()
		end
    end
    
end


function LevelScene:onKeyDown(event)
    if event.keyCode == KeyCode.BACK then 
        if application:getDeviceInfo() == "Android" then
			--Timer.pauseAllTimers()
			self.devil.timer:stop()
            sceneManager:changeScene("menu_scene", conf.TRANSITION_TIME,  SceneManager.fade, easing.inOutQuadratic)
        end
    end
end


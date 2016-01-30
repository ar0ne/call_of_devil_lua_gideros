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
	
	self.items = Items.new {
		level = self,
	}
	
	self:addChild(self.background)
	self:addChild(self.pentagram)
	self:addChild(self.moon)
	self:addChild(self.items)
	self:addChild(self.devil)
	self:addChild(self.score)
	

	self:addEventListener(Event.KEY_DOWN, self.onKeyDown, self)
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	self:addEventListener("TAP_ITEM", self.onTapItem, self)

end


function LevelScene:onEnterFrame()
	
end

function LevelScene:onTapItem(event)

	event:stopPropagation()
    
    if not self.paused then
        
		self.pentagram:changeDoorStatus(self.devil.devil_mc:getY(), conf.HEIGHT - self.devil.devil_height/2)

		self.score:dispatchEvent(Event.new("INCREMENT_SCORE"))
		
		self.devil:dispatchEvent(Event.new("CALL_DEVIL"))
		
    end
    
end


function LevelScene:onKeyDown(event)
	event:stopPropagation()
    if event.keyCode == KeyCode.BACK then 
        if application:getDeviceInfo() == "Android" then
			self.devil.timer:stop()
            sceneManager:changeScene("menu_scene", conf.TRANSITION_TIME,  SceneManager.fade, easing.inOutQuadratic)
        end
    end
end


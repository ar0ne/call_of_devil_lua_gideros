Devil = Devil or Core.class(Sprite)

function Devil:init(options)

	self.level = options.level
	
	local spritesheet = Texture.new("assets/images/devil.png")
	
	local anim = {
		Bitmap.new(TextureRegion.new(spritesheet,	0, 	0, 	100, 100)),
		Bitmap.new(TextureRegion.new(spritesheet, 100,  0,  100, 100)),
	}
	
	local scale = 2
	
	for i = 1, #anim do
        anim[i]:setAnchorPoint(0.5, 0.5)
        anim[i]:setScale(scale, scale)
    end
	
	self.devil_width = anim[1]:getWidth()
	self.devil_height = anim[1]:getHeight()
	
	local speed_frame = 20
	
	self.positions = {
		1,
		1 *	speed_frame + 1,
	}
	
	self.devil_mc = MovieClip.new{
		{ self.positions[1], 		speed_frame, 	anim[1]},
		{ self.positions[2], 	2 * speed_frame,   	anim[2]},
	}
	
	self.devil_mc:gotoAndPlay(1)
	self.devil_mc:setGotoAction(2 * speed_frame, self.positions[1])
	
	self.devil_y_pos = conf.HEIGHT + self.devil_height / 2
	self.devil_out = conf.HEIGHT - self.devil_height / 2
	
	self.devil_mc:setPosition(conf.MID_WIDTH, self.devil_y_pos)

	self:addChild(self.devil_mc)
	
	self.timer = Timer.new(1000, 1000)
	
	--self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)

	self.timer:start()
	
	local function onTimer(event)
		if self.devil_mc then
			local y = self.devil_mc:getY()
			-- print(y, self.devil_y_pos)
			if y < self.devil_y_pos then
				self.devil_mc:setY(y + 1)
			end
		end
	end
	 
	 
	self.timer:addEventListener(Event.TIMER, onTimer)
end


function Devil:onEnterFrame()

end

function Devil:callDevil()
	local y = self.devil_mc:getY()
	if y <= self.devil_y_pos then
		if y <= self.devil_out then
			self.timer:stop()
			sceneManager:changeScene("win_scene", conf.TRANSITION_TIME,  SceneManager.fade, easing.inOutQuadratic)
		end
		self.devil_mc:setY(y - 1)
	end
end



Items = Items or Core.class(Sprite)

function Items:init(options)

	self.level = options.level

	local scale = 2
	
	local item_width = 50
	
	local item1_button_spritesheet = Texture.new("assets/images/item1.png")
	local item1_btn_up = Bitmap.new(TextureRegion.new(item1_button_spritesheet, 0, 0, 50, 50))
	local item1_btn_down = Bitmap.new(TextureRegion.new(item1_button_spritesheet, 50, 0, 50, 50))
	
	item1_btn_up:setAnchorPoint(0.5, 0.5)
	item1_btn_down:setAnchorPoint(0.5, 0.5)
	
	item1_btn_up:setScale(scale, scale)
	item1_btn_down:setScale(scale, scale)
	
	self.item1_button = Button.new(item1_btn_up, item1_btn_down)
	self.item1_button:setPosition(item_width / 2, conf.MID_HEIGHT * 1 / 3)
	
	self.item1_button:addEventListener("click", 
		function() 
			print("clicked 1")
			local state_1 = self.item1_button:contains(self.item1_button.upState)
			local state_2 = self.item2_button:contains(self.item2_button.upState)
			print(state_1, state_2)
			
			self.item1_button:updateVisualState(not state_1)
			self.item2_button:updateVisualState(state_2)
			
			if state_1 and not state_2 then
				self.item2_button:updateVisualState(true)
				return
			end
			
			self.level:dispatchEvent(Event.new("TAP_ITEM"))
		end)
		
		
	local item2_button_spritesheet = Texture.new("assets/images/item2.png")
	local item2_btn_up = Bitmap.new(TextureRegion.new(item2_button_spritesheet, 0, 0, 50, 50))
	local item2_btn_down = Bitmap.new(TextureRegion.new(item2_button_spritesheet, 50, 0, 50, 50))
	
	item2_btn_up:setAnchorPoint(0.5, 0.5)
	item2_btn_down:setAnchorPoint(0.5, 0.5)
	
	item2_btn_up:setScale(scale, scale)
	item2_btn_down:setScale(scale, scale)
	
	self.item2_button = Button.new(item2_btn_up, item2_btn_down)
	self.item2_button:setPosition(conf.WIDTH - item_width / 2, conf.MID_HEIGHT * 1 / 3)
	
	self.item2_button:addEventListener("click", 
		function() 
			print("item 2")
			local state_1 = self.item1_button:contains(self.item1_button.upState)
			local state_2 = self.item2_button:contains(self.item2_button.upState)
			print(state_1, state_2)
			
			self.item1_button:updateVisualState(state_1)
			self.item2_button:updateVisualState(not state_2)
			
			if state_2 and not state_1 then
				self.item1_button:updateVisualState(true)
				return
			end
			
			self.level:dispatchEvent(Event.new("TAP_ITEM"))
			
		end)
			
		
		
	-- init 
	self.item1_button:updateVisualState(true)
	
	self:addChild(self.item1_button)
	self:addChild(self.item2_button)
	

--[[
	local spritesheet_item_1 = Texture.new("assets/images/item1.png")
	
	local anim = {
		Bitmap.new(TextureRegion.new(spritesheet_item_1,  0, 0, 50, 50)),
		Bitmap.new(TextureRegion.new(spritesheet_item_1, 50, 0, 50, 50)),
	}
	
	for i = 1, #anim do
        anim[i]:setAnchorPoint(0.5, 0.5)
        anim[i]:setScale(scale, scale)
    end
	

	
	self.item1_mc = MovieClip.new{
		{ 1,  20, 	anim[1]},
		{ 21, 40,   anim[2]},	
	}
	
	self.item1_mc:setGotoAction(20, 1)
	self.item1_mc:setGotoAction(40, 21)
	
	self.item1_mc:gotoAndPlay(1)
	
	
	
	
	local spritesheet_item_2 = Texture.new("assets/images/item2.png")
	
	local anim = {
		Bitmap.new(TextureRegion.new(spritesheet_item_2,  0, 0, 50, 50)),
		Bitmap.new(TextureRegion.new(spritesheet_item_2, 50, 0, 50, 50)),
	}

	for i = 1, #anim do
        anim[i]:setAnchorPoint(0.5, 0.5)
        anim[i]:setScale(scale, scale)
    end
		
	
	self.item2_mc = MovieClip.new{
		{ 1,  20, 	anim[1]},
		{ 21, 40,   anim[2]},	
	}
	
	self.item2_mc:setGotoAction(20, 1)
	self.item2_mc:setGotoAction(40, 21)
	
	self.item2_mc:gotoAndPlay(1)
	


	self.item_height = anim[1]:getHeight()
	self.item_width  = anim[1]:getWidth()
	
	self.item1_mc:setPosition(self.item_width / 2, conf.MID_HEIGHT * 1 / 3)
	self.item2_mc:setPosition(conf.WIDTH - self.item_width / 2, conf.MID_HEIGHT * 1 / 3)
	
	--self.item1_mc:addEventListener(Event.
	
	
	self:addChild(self.item1_mc)
	self:addChild(self.item2_mc)
	
--]]
	
end
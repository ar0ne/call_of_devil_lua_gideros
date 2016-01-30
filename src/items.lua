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

			local state_1 = self.item1_button:contains(self.item1_button.upState)
			local state_2 = self.item2_button:contains(self.item2_button.upState)
			
			if conf.DEBUG then 
				print("clicked 1") 
				print(state_1, state_2)
			end
			
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
			local state_1 = self.item1_button:contains(self.item1_button.upState)
			local state_2 = self.item2_button:contains(self.item2_button.upState)
			
			if conf.DEBUG then 
				print("clicked 2") 
				print(state_1, state_2)
			end
			
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
	
	
end
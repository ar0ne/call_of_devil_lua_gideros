MenuScene = MenuScene or Core.class(Sprite)

function MenuScene:init(options)

	local bg = Bitmap.new(Texture.new("assets/images/bg_menu_scene.png"))
	bg:setAnchorPoint(0.5, 0.5)
	bg:setScale(conf.WIDTH / bg:getWidth() * 1.2, 1)
	bg:setPosition(conf.MID_WIDTH, conf.MID_HEIGHT)
	
	local start_button_texture = Bitmap.new(Texture.new("assets/images/menu_button_start.png"))
	start_button_texture:setAnchorPoint(0.5, 0.5)
	
	local start_button_scale = conf.WIDTH / 2 / start_button_texture:getWidth()
	start_button_texture:setScale(start_button_scale, start_button_scale)
		
	local start_button = Button.new(start_button_texture, start_button_texture)
	start_button:setPosition(conf.MID_WIDTH, conf.MID_HEIGHT)
	
	start_button:addEventListener("click", 
		function() 
			sceneManager:changeScene("level_scene", conf.TRANSITION_TIME,  SceneManager.fade, easing.inOutQuadratic)
		end)
	
	self:addEventListener(Event.KEY_DOWN, self.onKeyDown, self)
	
	self:addChild(bg)
	self:addChild(start_button)

end


function MenuScene:onKeyDown(event)
    if event.keyCode == KeyCode.BACK then 
        if application:getDeviceInfo() == "Android" then
            application:exit()
        end
    end
end


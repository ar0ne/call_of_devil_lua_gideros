local W, H = application:getContentWidth(), application:getContentHeight()

conf = {

	HEIGHT              = H,
    WIDTH               = W,
	MID_WIDTH 			= W/2,
	MID_HEIGHT			= H/2,
    TRANSITION_TIME     = 1,
	DEBUG 				= true,
	FONT_SIZE 			= H / 8,
	SCORE_FONT_COLOR_HEX = 0xff0000,  -- red
	
	SOUND_ON_OFF_SCALE  = 0.15 * W,
	
	ANDROID_PACKAGE_NAME = "org.arone.call_of_devil",

}
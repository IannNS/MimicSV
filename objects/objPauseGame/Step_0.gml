/// @description
if(keyboard_check_pressed(vk_escape)){
	if(global.paused = false){
		getLayerIsPaused = layer_fx_is_enabled("ScreenShake");
		layer_enable_fx("ScreenShake", false);
		game_set_speed(60, gamespeed_fps);
		
		increment_alarms();
		
		part_systems_auto_update();
		
		with(all){
			getImageSpeed = image_speed;
			image_speed = 0;
		}
		global.paused = true;
	}
	else{
		game_set_speed(60, gamespeed_fps);
		
		part_systems_auto_update();
		
		with(all){
			image_speed = getImageSpeed;
		}
		global.paused = false;
	}
}

function GetAnimationEnd(){
	/// @description animation_end(sprite_index,image_index, rate)
	/// @param {real} <sprite_index> The index of the sprite being animated
	/// @param {real} <image_index> The current frame value
	/// @param {real} <rate> -See Below-
	///     The rate of change in frames per step if not
	///     using built in image_index/image_speed.  
	///     Don't use if you don't think you need this.  You probably don't.
 
	//returns true if the animation will loop this step.
 
	//Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
	//https://www.reddit.com/r/gamemaker/wiki/discord

	var sprite = sprite_index;
	var image = image_index;
	
	if(argument_count > 0){
		sprite = argument[0];
	}
	
	if(argument_count > 1){
		image = argument[1];
	}
	
	var type = sprite_get_speed_type(sprite_index);
	var spriteSpeed = sprite_get_speed(sprite_index)*image_speed;
	
	if(type == spritespeed_framespersecond){
		spriteSpeed = spriteSpeed/room_speed;
	}
	
	if(argument_count > 2){
		spriteSpeed = argument[2];
	}
	
	return image+spriteSpeed >= sprite_get_number(sprite);
}
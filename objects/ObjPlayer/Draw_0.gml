draw_sprite(sprPlayerShadow, 0, x, y);
draw_sprite_ext(sprite_index, image_index, x, y, hfacing, 1, 0, c_white, 1);

if(dodgeEnergy < 100){
	draw_healthbar(ObjPlayer. x -15, ObjPlayer.y +5, ObjPlayer.x - 14,ObjPlayer.y -20, dodgeEnergy, c_black, c_white, c_white, 2, true, false);
}

if(alpha > 0){
	gpu_set_fog(true,color,0,0);
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);
	gpu_set_fog(false,color,0,0);
}




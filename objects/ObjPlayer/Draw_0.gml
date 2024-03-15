draw_sprite_ext(sprPlayerShadow, image_index, x, y, 1, 1, 0, c_white, 1);
draw_sprite_ext(sprite_index, image_index, x, y, hfacing, 1, 0, c_white, 1);

if(dodgeEnergy < 100){
	draw_healthbar(ObjPlayer. x -15, ObjPlayer.y +5, ObjPlayer.x - 14,ObjPlayer.y -20, dodgeEnergy, c_black, c_white, c_white, 2, true, false);
}


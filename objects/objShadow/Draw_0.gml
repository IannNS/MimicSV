if(!surface_exists(surfaceShadow)){
	surfaceShadow = surface_create(room_width, room_height);
}

surface_set_target(surfaceShadow);

draw_clear_alpha(c_white, 0);

with(all){
	if(ObjPlayer){
		draw_sprite(sprPlayerShadow, 0, x, y);
	}
}



surface_reset_target();

draw_surface_ext(surfaceShadow, 0, 0, 1, 1, 0, c_black, 1);
surface_free(surfaceShadow);
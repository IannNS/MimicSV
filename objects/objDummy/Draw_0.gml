draw_sprite_ext(shadow, image_index, x, y+8, 1.25, 0.5, 0, c_white, 1);
draw_self();

if(alpha > 0){
	gpu_set_fog(true,color,0,0);
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);
	gpu_set_fog(false,color,0,0);
}
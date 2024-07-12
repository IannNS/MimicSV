// Os recursos de script mudaram para a v2.3.0; veja

function StickFree(){
	image_index = 1;
	if(direction > 15) && (direction < 165){
		depth = ObjPlayer.depth + 1;
	}

	else{
		depth = ObjPlayer.depth - 1;
	}

	if(direction > 90) && (direction < 270){
		image_yscale = -1;
	} 

	else{
		image_yscale = 1;
	}
	
	image_angle = direction;
	
	if(mouse_check_button_pressed(mb_left)){
		alarm[0] = 40;
		image_angle = direction;
		direction = point_direction(x, y, mouse_x, mouse_y);
		state = StickAttacking;
	}
}

function StickAttacking(){
	draw_self();
	if(image_index = 4 || image_index = 5){
		depth = ObjPlayer.depth + 1;
	}
}

function StickCharging(){
	image_index = 0;
}
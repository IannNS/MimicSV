if(targetRoom = World1){
	camera_set_view_size(0, 640, 360);
	room_set_viewport(World1, 0, true, 0, 0, 640, 360);
	surface_resize(application_surface, 640, 360);	
}if(targetRoom = TestZone){
	camera_set_view_size(0, 640, 360);
	room_set_viewport(World1, 0, true, 0, 0, 640, 360);
	surface_resize(application_surface, 640, 360);
} else if (targetRoom = Menu){
	camera_set_view_size(0, 1920, 1080);
	room_set_viewport(Menu, 0, true, 0, 0, 1920, 1080);
	surface_resize(application_surface, 1920, 1080);
}

switch(state){
	case states.OUT:
		if (subImageIndex < imax + xmax){
			subImageIndex += subImageIncriment;
		} else{
			state = states.IN;
			if room_exists(targetRoom) room_goto(targetRoom);
		}
	break;
	case states.IN:
		if (subImageIndex > 0){
			subImageIndex -= subImageIncriment;
		} else instance_destroy();
	break;
}
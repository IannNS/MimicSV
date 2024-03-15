color = c_white;
alpha = 0;
layer_enable_fx("ScreenShake", false);

function StatePatrol(){
	objDummy.image_index = 0;
	
	if(place_meeting(x, y, ObjPlayer) && ObjPlayer.state = StateCombat){
		alarm[0] = 30;
		alpha = 1;
		layer_enable_fx("ScreenShake", true);
		state = StateTookDamage;
		
		hitDir = point_direction(x, y, mouse_x, mouse_y);
		
		dmgPart = part_system_create(damageParticle);
		part_system_position(dmgPart, x, y-20);
		part_system_depth(dmgPart, objDummy.depth);
		part_system_angle(dmgPart, hitDir - 90);
	}
}

function StateTookDamage(){
	
}

state = StatePatrol;

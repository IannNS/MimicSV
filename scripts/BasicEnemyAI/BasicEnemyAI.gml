function StatePatrol(){
	if (attackPlayer == false && los == true){
		if(playerDistance < 140){
			playerClose = true;
			sprite_index = MinorTankTarget;
			state = StateTarget;
		}
	}
	
	if(spawnDistance > 160){
		var x1 = x;
		var y1 = y;
		var x2 = xstart;
		var y2 = ystart;
		
		if(mp_grid_path(ObjPathmaker.overallGrid, pathBackToSpawn, x1, y1, x2, y2, true)){
			path_start(pathBackToSpawn, 0.5, path_action_stop, false);
			if(los == true && playerDistance < 140){
				path_end();
				playerClose = true;
				sprite_index = MinorTankTarget;
				state = StateTarget;
			}
		}
	}
}

function StateTarget(){
	playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);
	if(playerDistance < 80 && los = true){
		attackPlayer = true;
		sprite_index = MinorTankAttack;	
		state = StateAttack;
	}
	
	else if (playerDistance > 160 && los == true){
		playerClose = false;
		sprite_index = MinorTankPatrol;
		state = StatePatrol;
	}
	
	else if (los == false){
		playerClose = false;
		sprite_index = MinorTankPatrol;
		state = StatePatrol;
	}
}

function StateAttack(){
	playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);
	if(los == true && attackPlayer == true && playerDistance > 80){
	
		dir = point_direction(x, y, ObjPlayer.x,  ObjPlayer.y);
				
		hmovement = lengthdir_x(wlkSpeed, dir);
		vmovement = lengthdir_y(wlkSpeed, dir);
		
		x += hmovement;
		y += vmovement;
	}

	if(los == false && attackPlayer == true){
		playerDistance = point_distance(x, y, ObjPlayer.lastSeenX,  ObjPlayer.lastSeenY);
		dir = point_direction(x, y, ObjPlayer.lastSeenX,  ObjPlayer.lastSeenY);
			
		hmovement = lengthdir_x(wlkSpeed, dir);
		vmovement = lengthdir_y(wlkSpeed, dir);
		
		x += hmovement;
		y += vmovement;
	
		if(playerDistance < 5 && los == false){
			alarm[1] = 100;
			sprite_index = MinorTankTarget;
			attackPlayer = false;
		}
	}
	
	if(alarm[1] < 0 && los = false && attackPlayer = false){
		playerClose = false;
		sprite_index = MinorTankPatrol;
		state = StatePatrol;
	}
}
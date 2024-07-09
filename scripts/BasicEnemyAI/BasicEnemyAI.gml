function StatePatrol(){
	if(spawnDistance < 160 && playerClose == false){
		var x1 = x;
		var y1 = y;
		var x2 = irandom_range(x, y+160 || y-160);
		var y2 = irandom_range(y, y+160 || y-160);
	}
	
	if (attackPlayer == false && los == true){
		if(playerDistance < 140){
			path_end();
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
			
			if(spawnDistance < 60){
				path_end();
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
	path_end();
	playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);
	if(los == true && attackPlayer == true && playerDistance > 80){
		var x1 = x;
		var y1 = y;
		var x2 = ObjPlayer.x;
		var y2 = ObjPlayer.y;
		if(mp_grid_path(ObjPathmaker.overallGrid, pathToTarget, x1, y1, x2, y2, true)){
			path_start(pathToTarget, 1, path_action_stop, false);
		}
	}

	if(los == false && attackPlayer == true){
		path_end();
		playerDistance = point_distance(x, y, ObjPlayer.lastSeenX,  ObjPlayer.lastSeenY);
		var x1 = x;
		var y1 = y;
		var x2 = ObjPlayer.lastSeenX;
		var y2 = ObjPlayer.lastSeenY;
		if(mp_grid_path(ObjPathmaker.overallGrid, pathToTarget, x1, y1, x2, y2, true)){
			path_start(pathToTarget, 1, path_action_stop, false);
		}
	
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
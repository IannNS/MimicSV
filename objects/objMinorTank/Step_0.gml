/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event

event_inherited();

playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);

if(collision_line(x, y, ObjPlayer.x, ObjPlayer.y, objBasicWall, true, false)){
	los = false;
}

else{
	lastX = ObjPlayer.xprevious;
	lastY = ObjPlayer.yprevious;
	los = true;
}

if (attackPlayer == false && los == true){
	if(playerDistance < 140){
		playerClose = true;
		sprite_index = MinorTankTarget;
			if(playerDistance < 80){
			attackPlayer = true;
			sprite_index = MinorTankAttack;	
		}
	}
	
	else{
		sprite_index = MinorTankPatrol;
	}
}

if(los == true && attackPlayer == true && playerDistance > 80){
	
	dir = point_direction(x, y, ObjPlayer.x,  ObjPlayer.y);
			
	hmovement = lengthdir_x(wlkSpeed, dir);
	vmovement = lengthdir_y(wlkSpeed, dir);
		
	x += hmovement;
	y += vmovement;
}

if(los == false && attackPlayer == true){
	dir = point_direction(x, y, lastX,  lastY);
			
	hmovement = lengthdir_x(wlkSpeed, dir);
	vmovement = lengthdir_y(wlkSpeed, dir);
		
	x += hmovement;
	y += vmovement;
	
	if(x = lastX && y = lastY){
		sprite_index = MinorTankTarget;
		attackPlayer = false;
	}
}
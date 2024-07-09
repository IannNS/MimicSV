/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

spawnDistance = point_distance(xstart, ystart, x, y);

playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);

if(collision_line(x, y, ObjPlayer.x, ObjPlayer.y, objBasicWall, true, false)){
	los = false;
}

else{
	los = true;
}

script_execute(state);

// Inherit the parent event
event_inherited();

show_debug_message("Distancia até o spawn: {0}", spawnDistance);
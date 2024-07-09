/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event

event_inherited();

spawnDistance = point_distance(xstart, ystart, x, y);
lastPointSeen = collision_line(xstart, ystart, x, y, objBasicWall, true, false);

playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);

if(collision_line(x, y, ObjPlayer.x, ObjPlayer.y, objBasicWall, true, false)){
	los = false;
}

else{
	los = true;
}

script_execute(state);

show_debug_message("Distancia até o spawn: {0}", spawnDistance);
show_debug_message("Distancia até o ultimo ponto visto: {0}", lastPointSeen);
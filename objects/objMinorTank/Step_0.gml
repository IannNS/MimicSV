/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Aponta a distância até o spawn
spawnDistance = point_distance(xstart, ystart, x, y);

//Aponta a distância até o jogador
playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);

//Se houver colisão com a parede, los = false
if(collision_line(x, y, ObjPlayer.x, ObjPlayer.y, objBasicWall, true, false)){
	los = false;
}

//Se não, los = true
else{
	los = true;
}

script_execute(state);

//Inherit the parent event
event_inherited();

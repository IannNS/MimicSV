/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

pathToTarget = path_add();
pathBackToSpawn = path_add();
spawnDistance = 0;

lastSeenX = 0;
lastSeenY = 0;

los = false;
playerDistance = 0;

hmovement = 0;
vmovement = 0;
wlkSpeed = 1;

playerClose = false;
attackPlayer = false;



/*
state = noone;
time_state = room_speed * 10;
timer_state = 0;


state_change = funcion(_state)
{
	time_state--;
	timer_state = irandom(time_state);
	if(timer_state == time_state or time_state <= 0)
	{
		state = _state;
		time_state = room_speed * 10;
	}
}

stoped = function()
{
	state_change(walkingAway);
	
}

walkingAway = function()
{
	show_debug_message("Estou passeando");
	
	image_blend = c_blue;
	
	state_change(stoped);
}

*/




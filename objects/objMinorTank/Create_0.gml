/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
startX = x;
startY = y;

los = false;
playerDistance = 0;

lastX = 0;
lastY = 0;

hmovement = 0;
vmovement = 0;
wlkSpeed = 1;


playerClose = false;
attackPlayer = false;


//Criando a movimentação aleatória da IA
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

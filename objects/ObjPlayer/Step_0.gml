layer_depth("Vignhet", -room_height)
layer_depth("ScreenShake", -room_height);
CameraFollow();

up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

script_execute(state);

depth = -y;

if ((xprevious != x or yprevious != y) and canCreateDust = true and ObjPlayer.state = StateFree){
	part_system_depth(partSystem, ObjPlayer.depth +2)
	canCreateDust = false;
	var randomTime = irandom_range(-1, 2);
	alarm_set(4, 8 + randomTime);
	alarm[5] = 10;
}

if alarm[1] <= 0{
	dodgeEnergy  += 1;
}

dodgeEnergy = clamp(dodgeEnergy, 0, 100);
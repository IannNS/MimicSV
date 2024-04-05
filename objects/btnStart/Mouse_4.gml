event_inherited();

if !instance_exists(objTransition){
	var inst = instance_create_layer(x, y, "Instances", objTransition);
	if room = Menu inst.targetRoom = TestZone else inst.targetRoom = Menu;
}

y = ystart + 4;


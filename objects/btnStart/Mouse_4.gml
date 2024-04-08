event_inherited();

if !instance_exists(objRoomTransition){
	var inst = instance_create_layer(x, y, "Instances", objRoomTransition);
	if room = Menu inst.targetRoom = TestZone else inst.targetRoom = Menu;
}

y = ystart + 4;


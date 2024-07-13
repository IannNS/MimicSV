/// @description Mecânicas de hit

if (canDealDamage = true && ObjPlayer.state != StateLongDodge && attackReady = true){
	attackReady = false;
	canDealDamage = false;
	alarm[0] = 60;

	global.currentLife -= 1;
	ObjPlayer.alarm[6] = 30;
	
	fx_set_parameter(ObjPlayer.screenShakePar, "g_Magnitude", 2);
	layer_enable_fx("ScreenShake", true);
	ObjPlayer.color = #f12000;
	ObjPlayer.alpha = 1;
}
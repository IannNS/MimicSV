/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Take Life away from the Player
if(canDealDamage = true && ObjPlayer.state != StateLongDodge){
	canDealDamage = false;
	alarm[1] = 180;
	
	global.currentLife -= 1;
	ObjPlayer.alarm[6] = 30;
	
	fx_set_parameter(ObjPlayer.screenShakePar, "g_Magnitude", 2);
	layer_enable_fx("ScreenShake", true);
	ObjPlayer.color = #f12000;
	ObjPlayer.alpha = 1;
}
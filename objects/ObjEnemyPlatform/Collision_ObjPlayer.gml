/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Take Life away from the Player
if canDealDamage = true && ObjPlayer.state != StateLongDodge && attackReady = true{
	attackReady = false;
	canDealDamage = false;
	alarm[0] = 60;
	alarm[1] = 180;
	
	global.currentLife -= 1;
	ObjPlayer.alarm[6] = 30;
	
	fx_set_parameter(ObjPlayer.screenShakePar, "g_Magnitude", 2);
	layer_enable_fx("ScreenShake", true);
	ObjPlayer.color = #f12000;
	ObjPlayer.alpha = 1;
}

if canTakeDamage = true && ObjPlayer.state = StateCombat{
	canTakeDamage = false;
	alarm[0] = 30;
	
	EnemyLife -= 1;
}

if EnemyLife = 0 && instance_exists{
	instance_destroy();	
}

EnemyLife = clamp(EnemyLife, 0, 3);
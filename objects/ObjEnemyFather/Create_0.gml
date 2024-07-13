/// @description Criação de variáveis base dos inimigos
function Collision(){
		var targetX = x;
		var targetY = y;
		
		x = xprevious;
		y = yprevious;
		
		var distanceX = abs(targetX - x);
		var distanceY = abs(targetY - y);
		
		repeat(distanceX){
			if !place_meeting(x + sign(targetX - x), y, all) x += sign(targetX - x);
		}
		
		repeat(distanceY){
			if !place_meeting(x, y + sign(targetY - y), all) y += sign(targetY - y);
	}
}

canDealDamage = false;
canTakeDamage = true;
EnemyMaxLife = 3;
EnemyCurrentLife = EnemyMaxLife;
attackReady = true;
function StateFree(){
	mask_index = idleDown;
	image_xscale = hfacing;
	//Adquirir valores Horizontal x Vertical
	hmovement = right - left;
	vmovement =	down - up;
	
	if(instance_exists(ObjWeapon)){
		dir = point_direction(x, y, mouse_x, mouse_y);
		
		if(dir > 90) && (dir < 270){
			hfacing = -1;
		}
		
		else{
			hfacing = 1;
		}
	}
	
	else{
		if hmovement != 0 hfacing = hmovement;
	}

	alarm[9] -= 1;
	
	//Mover personagem para direção dos valores 
	if hmovement != 0 or vmovement != 0{
		dir = point_direction(0, 0, hmovement, vmovement);
			
		hmovement = lengthdir_x(wlkSpeed, dir);
		vmovement = lengthdir_y(wlkSpeed, dir);
		
		x += hmovement;
		y += vmovement;
	}
		

	//Função de colisões (possível alteração)
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
	
	//animção de movimentação
	if hmovement != 0 or vmovement != 0{
			
		if(instance_exists(ObjWeapon)){
			dir = point_direction(x, y, mouse_x, mouse_y);
			
			//direita e esquerda
			if(dir < 65) || (dir > 295) || (dir > 115) || (dir < 245){
				sprite_index = walkSideStick;
			}
			
			//cima
			if(dir > 65) && (dir < 115){
				sprite_index = walkUpStick;
			}
			
			//baixo
			if(dir > 245) && (dir < 295){
				sprite_index = walkDownStick;
			}
		}
			
		else{
			if keyboard_check(ord("D")) or keyboard_check(ord("A")){
				sprite_index = walkSide;
			}
			
			else if keyboard_check(ord("W")){
				sprite_index = walkUp;
			}
			
			else if keyboard_check(ord("S")){
				sprite_index = walkDown;
			}
		}
	}
		
	//animação de idle
	else{
		
		if(instance_exists(ObjWeapon)){
			dir = point_direction(x, y, mouse_x, mouse_y);
			
			//direita e esquerda
			if(dir < 65) || (dir > 295) || (dir > 115) || (dir < 245){
				sprite_index = idleSideStick;
			}
			
			//cima
			if(dir > 65) && (dir < 115){
				sprite_index = idleUpStick;
			}
			
			//baixo
			if(dir > 245) && (dir < 295){
				sprite_index = idleDownStick;
			}
		}
		
		else{
			if dir = 270{
				sprite_index = idleDown;
			}
			
			else if dir = 45 or dir = 0 or dir = 135 or dir = 315 or dir = 180 or dir = 225{
				sprite_index = idleSide;
			}
			
			else if dir = 90{
				sprite_index = idleUp;
			}
		}
	}
		
	//Tecla de cura
	if keyboard_check_pressed(ord("H")) && global.currentRage >= 20 && global.currentLife < global.maxLife{
		alarm[7] = 600;
	
		global.currentRage -= 20;
		global.currentLife += 1;
		color = #00fb3f;
		alpha = 1;
	}
		
	if keyboard_check_pressed(vk_shift) && dodgeEnergy >= 10 && (hmovement != 0 or vmovement != 0){
		dodgeSpeed = 6;
		dodgeEnergy -= 10;
		alarm[1] = 60;
			
		alarm[0] = 10;
		instance_deactivate_object(ObjWeapon);
			
		dodgeDir = point_direction(0, 0, hmovement, vmovement);
		state = StateShortDodge;
	}
		
	if keyboard_check_pressed(vk_space) && dodgeEnergy >= 25 && (hmovement != 0 or vmovement != 0){
		dodgeSpeed = 3;
		dodgeEnergy -= 25;
		alarm[1] = 60;
			
		alarm[0] = 32;
		instance_deactivate_object(ObjWeapon);
			
		dodgeDir = point_direction(0, 0, hmovement, vmovement);
		
		state = StateLongDodge;
	}
		
	if mouse_check_button_pressed(mb_left) && dodgeEnergy >= 5{
		dodgeEnergy -= 5;
		alarm[1] = 60;
		alarm[2] = 40;
			
		attackDir = point_direction(x, y, mouse_x, mouse_y);
		
		state = StateCombat;
	}
		
	if global.currentLife <= 0{
		image_index = 0;
		alarm[8] = 140;
		state = StateDeath;
	}
}
	
function StateLongDodge(){
	hmovement = lengthdir_x(dodgeSpeed, dodgeDir);
	vmovement = lengthdir_y(dodgeSpeed, dodgeDir);
	
	//baixo
	if dodgeDir = 270{
		sprite_index = dodgeDown;
	}
	
	//lado direito
	else if dodgeDir = 45 or dodgeDir = 0 or dodgeDir = 315{
		hfacing = 1;
		sprite_index = dodgeSide;
	}
	
	//lado esquerdo
	else if dodgeDir = 135 or dodgeDir = 180 or dodgeDir = 225{
		hfacing = -1;
		sprite_index = dodgeSide;
	}
	
	//cima
	else if dodgeDir = 90{
		sprite_index = dodgeUp;
	}
	x += hmovement;
	y += vmovement;
}
	
function StateShortDodge(){
	//Instancia de criação da sombra da esquiva curta
	with (instance_create_depth(x, y, depth+1, ObjDashTrail)){
		sprite_index = other.sprite_index;
		image_blend = c_white;
		image_alpha = 0.7;
	}
	
	hmovement = lengthdir_x(dodgeSpeed, dodgeDir);
	vmovement = lengthdir_y(dodgeSpeed, dodgeDir);
	
	x += hmovement;
	y += vmovement;
}
	
function StateCombat(){
	if(instance_exists(ObjWeapon)){
		//lados
		if(attackDir < 65) || (attackDir > 295) || (attackDir > 115) || (attackDir < 245){
			sprite_index = StickAttackSide;
		}
			
		//cima
		if(attackDir > 65) && (attackDir < 115){
			sprite_index = StickAttackUp;
		}
			
		//baixo
		if(attackDir > 245) && (attackDir < 295){
			sprite_index = StickAttackDown;
		}
	}
}
	
function StateDeath(){
	display_set_gui_size(0,0);
	
	depth = -room_height;
	layer_depth("Background", depth+100);
	sprite_index = sprDeathAnim;
}
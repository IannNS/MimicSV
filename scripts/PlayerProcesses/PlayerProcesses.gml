function StateFree(){
	mask_index = idleDown;
	image_xscale = hfacing;
	//Adquirir valores Horizontal x Vertical
	hmovement = right - left;
	vmovement =	down - up;
	
	if hmovement != 0 hfacing = hmovement;
	
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
			if keyboard_check(ord("D")) or keyboard_check(ord("A")){
				sprite_index = walkSideStick;
			}
			
			else if keyboard_check(ord("W")){
				sprite_index = walkUpStick;
			}
			
			else if keyboard_check(ord("S")){
				sprite_index = walkDownStick;
			}
		}
		
		//animação de idle
		else{
			if dir = 270{
				sprite_index = idleDownStick;
			}
			
			else if dir = 45 or dir = 0 or dir = 135 or dir = 315 or dir = 180 or dir = 225{
				sprite_index = idleSideStick;
			}
			
			else if dir = 90{
				sprite_index = idleUpStick;
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
			dodgeDir = point_direction(0, 0, hmovement, vmovement);
			state = StateShortDodge;
		}
		
		if keyboard_check_pressed(vk_space) && dodgeEnergy >= 25 && (hmovement != 0 or vmovement != 0){
			dodgeSpeed = 3;
			dodgeEnergy -= 25;
			alarm[1] = 60;
			
			alarm[0] = 32;
			dodgeDir = point_direction(0, 0, hmovement, vmovement);
			state = StateLongDodge;
		}
		
		else if mouse_check_button_pressed(mb_left) && dodgeEnergy >= 5{
			dodgeEnergy -= 5;
			alarm[1] = 60;
			
			if comboCount = 0{
				image_index = 0;
				alarm[2] = 20;
			} else if comboCount = 1{
				image_index = 0;
				alarm[2] = 16;
			} else if comboCount = 2{
				image_index = 0;
				alarm[2] = 16;
			}
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
	if dir = 270{
		sprite_index = dodgeDown;
	}
	else if dir = 45 or dir = 0 or dir = 135 or dir = 315 or dir = 180 or dir = 225{
		sprite_index = dodgeSide;
	}
	else if dir = 90{
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
	if dir = 270{
		
	}
	else if dir = 45 or dir = 0 or dir = 135 or dir = 315 or dir = 180 or dir = 225{
		
	}
	else if dir = 90{
		
	}
	x += hmovement;
	y += vmovement;
}
	
function StateCombat(){
	if attackDir >= 250 && attackDir <= 290{
		hfacing = 1;
		dir = 270;
		if (comboCount = 0){
			sprite_index = comboDown1;
			mask_index = comboDown1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboDown2;
			mask_index = comboDown2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboDown3;
			mask_index = comboDown3_hb;
			image_xscale = hfacing;
		}
	}
			
	else if attackDir >= 0 && attackDir <= 20 or attackDir >= 340 && attackDir <= 360{
		hfacing = 1;
		dir = 0;
		if (comboCount = 0){
			sprite_index = comboSide1;
			mask_index = comboSide1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboSide2;
			mask_index = comboSide2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboSide3;
			mask_index = comboSide3_hb;
			image_xscale = hfacing;
		}
	}
	
	else if attackDir >= 160 && attackDir <= 200{
		hfacing = -1;
		dir = 0;
		if (comboCount = 0){
			sprite_index = comboSide1;
			mask_index = comboSide1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboSide2;
			mask_index = comboSide2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboSide3;
			mask_index = comboSide3_hb;
			image_xscale = hfacing;
		}
	}
			
	else if attackDir >= 80 && attackDir <= 110{
		hfacing = 1;
		dir = 90;
		if (comboCount = 0){
			sprite_index = comboUp1;
			mask_index = comboUp1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboUp2;
			mask_index = comboUp2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboUp3;
			mask_index = comboUp3_hb;
			image_xscale = hfacing;
		}
	}
	
	else if attackDir > 20 && attackDir < 80{
		hfacing = 1;
		dir = 0;
		if (comboCount = 0){
			sprite_index = comboDiagUp1;
			mask_index = comboUp1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboDiagUp2;
			mask_index = comboDiagUp2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboDiagUp3;
			mask_index = comboDiagUp3_hb;
			image_xscale = hfacing;
		}
	}
	
	else if attackDir > 110 && attackDir < 160{
		hfacing = -1;
		dir = 0;
		if (comboCount = 0){
			sprite_index = comboDiagUp1;
			mask_index = comboUp1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboDiagUp2;
			mask_index = comboDiagUp2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboDiagUp3;
			mask_index = comboDiagUp3_hb;
			image_xscale = hfacing;
		}
	}
	
	else if attackDir > 290 && attackDir < 340{
		hfacing = 1;
		dir = 0;
		if (comboCount = 0){
			sprite_index = comboDiagDown1;
			mask_index = comboUp1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboDiagDown2;
			mask_index = comboDiagDown2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboDiagDown3;
			mask_index = comboDiagDown3_hb;
			image_xscale = hfacing;
		}
	}
	
	else if attackDir > 200 && attackDir < 250{
		hfacing = -1;
		dir = 0;
		if (comboCount = 0){
			sprite_index = comboDiagDown1;
			mask_index = comboUp1_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 1){
			sprite_index = comboDiagDown2;
			mask_index = comboDiagDown2_hb;
			image_xscale = hfacing;
		}
		else if (comboCount = 2){
			sprite_index = comboDiagDown3;
			mask_index = comboDiagDown3_hb;
			image_xscale = hfacing;
		}
	}
}
	
function StateDeath(){
	display_set_gui_size(0,0);
	
	depth = -room_height;
	layer_depth("Background", depth+100);
	sprite_index = sprDeathAnim;
}
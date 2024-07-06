//Esse script é responsável pela decisão das animações do jogador, com base na classe selecionada.
function IdleAnimation(){
	while ObjPlayer.state = StateFree && StateFree.hmovement = 0 && StateFree.vmovement = 0{
		if trueDir != 3 || trueDir != 7{
			image_index = spriteIdleSide;
		}
	
		else if truDir = 3{
			image_index = spriteIdleUp;
		}
	
		else if trueDir = 7{
			image_index = spriteIdleDown;
		}
	}
}

function Walkanimation(){
	if trueDir != 3 || trueDir != 7{
		image_index = spriteWalkSide;
	}
	
	else if truDir = 3{
		image_index = spriteWalkUp;
	}
	
	else if trueDir = 7{
		image_index = spriteWalkDown;
	}
}

function AttackAnimation(){
	switch(trueDir){
		case 1:
			if comboCount = 0{
				
			}
			
			else if comboCount = 1{
				
			}
			
			else if comboCount = 2{
				
			}
		break;
		
		case 2:
		
		break;
		
		case 3:
		
		break;
		
		case 4:
		
		break;
		
		case 5:
		
		break;
		
		case 6:
		
		break;
		
		case 7:
		
		break;
		
		case 8:
		
		break;
	}
}

function DeathAnimation(){
	image_index = deathSprite;
}
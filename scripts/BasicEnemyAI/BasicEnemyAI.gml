//Script de IA básica para o inimigo Minor Tank.

function StatePatrol(){
	//Se o inimigo estiver dentro da área de spawn, escolher um ponto aleatório dentro da área para ele ir.
	if(spawnDistance < 160 && playerClose == false){
		alarm[2] -= 1;
		
		var x1 = x;
		var y1 = y;
		
		//Quando o alarme terminar, escolher a direção e ir.
		if(alarm[2] <= 0){
			xgo = irandom_range(xstart -160, xstart +160);
			ygo = irandom_range(ystart -160, ystart +160);
			
			//Cria o caminho até o ponto aleatório
			if(mp_grid_path(ObjPathmaker.overallGrid, pathIdle, x1, y1, xgo, ygo, true)){
				path_start(pathIdle, 0.5, path_action_stop, false);
			
			//Se estiver muito longe, finalizar caminho.
			if(spawnDistance > 160){
					path_end();
				}
			}
		alarm[2] += 600;
		}
	}
	
	//Se houver los e o jogador estiver próximo o suficiente, mudar o estado.
	if (attackPlayer == false && los == true){
		if(playerDistance < 140){
			path_end();
			playerClose = true;
			sprite_index = MinorTankTarget;
			state = StateTarget;
		}
	}
	
	//Se estiver longe o suficiente do spawn, criar um caminho até o ponto inicial e ir até ele.
	if(spawnDistance > 160){
		var x1 = x;
		var y1 = y;
		var x2 = xstart;
		var y2 = ystart;
		
		//Cria o caminho até o ponto de spawn.
		if(mp_grid_path(ObjPathmaker.overallGrid, pathBackToSpawn, x1, y1, x2, y2, true)){
			path_start(pathBackToSpawn, 0.5, path_action_stop, false);
			if(los == true && playerDistance < 140){
				path_end();
				playerClose = true;
				sprite_index = MinorTankTarget;
				state = StateTarget;
			}
			
			//Escolhe uma distância aleatória próxima do spawn para ele parar.
			if(spawnDistance <= irandom_range(20, 60)){
				path_end();
			}
		}
	}
}

function StateTarget(){
	//Se próxim o suficiente e houver los, mudar de estado.
	playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);
	if(playerDistance < 80 && los = true){
		attackPlayer = true;
		sprite_index = MinorTankAttack;	
		state = StateAttack;
	}
	
	//Se longe o suficiente, voltar ao estado livre.
	else if (playerDistance > 160 && los == true){
		playerClose = false;
		sprite_index = MinorTankPatrol;
		state = StatePatrol;
	}
	
	//Se não houver linha de visão, voltar ao estado livre.
	else if (los == false){
		playerClose = false;
		sprite_index = MinorTankPatrol;
		state = StatePatrol;
	}
}

function StateAttack(){
	//Finaliza caminhos anteriores para as decisões de ataque.
	path_end();
	playerDistance = point_distance(x, y, ObjPlayer.x, ObjPlayer.y);
	
	//Se o player começar a se distanciar, houver linha de visão e ainda no estado de ataque, criar um caminho até o player.
	if(los == true && attackPlayer == true && playerDistance >= 40){
		var x1 = x;
		var y1 = y;
		var x2 = ObjPlayer.x;
		var y2 = ObjPlayer.y;
		//Cria o caminho até o player e vai até ele.
		if(mp_grid_path(ObjPathmaker.overallGrid, pathToTarget, x1, y1, x2, y2, true)){
			path_start(pathToTarget, 1, path_action_stop, false);
		}
	}
	
	//Estrutura de decisão para os ataques do inimigo.
	//Caso próximo o suficiente, houver los e estiver no estado de ataque, iniciar estrutura de ataques.
	if(playerDistance <= 40 && los == true && attackPlayer == true){
		path_end();
		chooseAttack = irandom_range(1, 3);
		state = StateAttacking;
	}
	
	//Caso perder visão do jogador
	if(los == false && attackPlayer == true){
		path_end();
		
		//Aponta até o último ponto de visão do jogador.
		playerDistance = point_distance(x, y, ObjPlayer.lastSeenX,  ObjPlayer.lastSeenY);
		var x1 = x;
		var y1 = y;
		var x2 = ObjPlayer.lastSeenX;
		var y2 = ObjPlayer.lastSeenY;
		
		//Cria o caminho até o último ponto de visão e vai até ele.
		if(mp_grid_path(ObjPathmaker.overallGrid, pathToTarget, x1, y1, x2, y2, true)){
			path_start(pathToTarget, 1, path_action_stop, false);
		}
		
		//Se a distância for menor que 5 e não houver visão, mudar para o estado de alerta por 1 segundo.
		if(playerDistance < 5 && los == false){
			alarm[1] = 100;
			sprite_index = MinorTankTarget;
			attackPlayer = false;
		}
	}
	
	//Cao não veja o jogador novamente, voltar ao estado livre.
	if(alarm[1] < 0 && los = false && attackPlayer = false){
		playerClose = false;
		sprite_index = MinorTankPatrol;
		state = StatePatrol;
	}
}

function StateAttacking(){
	switch(chooseAttack){
		case 1:
			//combo de 3 ataques em sequencia
			/* 
			primeiro e segundo ataque devem fazer o inimigo ir um pouco na direção do jogador, 
			o terceiro deve fazer ele ir um pouco mais longe. Após a finalização do combo, se
			manter um pouco parado para abrir a janela de dano para o jogador.
			*/
			
			state = StateAttack;
		break;
		
		case 2:
			//movimenta pra alguma diagonal em direção ao jogador e faz 1 ataque
			/* 
			move-se para uma diagonal em relação ao jogador e executa um ataque na direção do mesmo,
			indo um pouco para a frente. Deve haver uma janela de dano após o inimigo ir para a diagonal e
			após a execução do ataque.
			*/
			
			state = StateAttack;
		break;
			
		case 3:
			//movimenta para atrás e ataca 1 vez
			/* 
			o inimigo deve ir contra a direção do jogador para evitar um ataque, em seguida, deve
			executar um ataque forte em direção ao jogador, indo rapidamente para a sua direção e 
			causando mais pontos de dano.
			*/
			state = StateAttack;
		break;
	}
}
// Os recursos de script mudaram para a v2.3.0; veja

function StickFree(){
	image_index = 1;
	if(direction > 15) && (direction < 165){
		depth = ObjPlayer.depth + 1;
	}

	else{
		depth = ObjPlayer.depth - 1;
	}

	if(direction > 90) && (direction < 270){
		image_yscale = -1;
	} 

	else{
		image_yscale = 1;
	}
	
	image_angle = direction;
	
	if(mouse_check_button_pressed(mb_left)){
		alarm[0] = 40;
		image_angle = direction;
		direction = point_direction(x, y, mouse_x, mouse_y);
		
		//Descrição da lógica de hit do bastão
		//limpa a lista de hits para não aplicar a lógica nos inimigos atingidos anteriormente
		ds_list_clear(hitByAttack);
		
		//cria uma lista temporária dos inimigos que acabaram de ser atingidos e salva seus IDs
		var hitByAttackNow = ds_list_create();
		var hits = instance_place_list(x, y, ObjEnemyFather, hitByAttackNow, false);
		
		//Se houver inimigos atingidos
		if(hits > 0){
			//Adiciona numa variável temporária para comparação
			for(var i = 0; i < hits; i++){
				var hitID = hitByAttackNow[| i];
				if(ds_list_find_index(hitByAttack,hitID) == -1){
					//Se não estiverem na lista de alvos atingidos, adiciona-los
					ds_list_add(hitByAttack, hitID);
					//Lógica aplicada para os inimigos atingidos
					with(hitID){
						EnemyCurrentLife -= 1;
					}
				}
			}
		}
		//Destrói a lista para evitar vazamento de dados
		ds_list_destroy(hitByAttackNow);
		
		state = StickAttacking;
	}
}

function StickAttacking(){
	draw_self();
	if(image_index = 4 || image_index = 5){
		depth = ObjPlayer.depth + 1;
	}
}

function StickCharging(){
	image_index = 0;
}
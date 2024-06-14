/// @description
global.paused = false;

//Função responsável por pausar e desenhar todas as particulas na tela
function part_systems_auto_update(){
	//variável de número de emissores
	var i = 0;
	/*enquanto o número de emissores for < 20 (pode ser alterado de acordo com a necessidade),
	ele desenha e pausa todas as particulas*/
	while(i < 20){
		//se eles estiverem na cena...
		if(part_system_exists(i)){
			/*auto_update é uma função que controla a emissão de particulas (por padrão, automátioc),
			mas pode ser alterada para um valor boolean (pausar a atualização automática), o que 
			facilita a função de pause*/
			part_system_automatic_update(i, global.paused)
		}
		//incrementa o próximo emissor, até o total de 20 (pode ser alterado de acordo com a necessidade)
		i++
	}
}

//Função para pausar os alarmes do jogo
function increment_alarms(){
	with(all){
		//pula o objeto de pause 
		if(object_index = objPauseGame) continue
		
		//loop de todos os alarmes de todos os objetos
		for(var i = 0; i < 12; i++){
			if(alarm[i] > 0){
			   alarm[i] += 1; //adiciona 1 no alarme se eles estiverem ativos
			}
		}
	}
}
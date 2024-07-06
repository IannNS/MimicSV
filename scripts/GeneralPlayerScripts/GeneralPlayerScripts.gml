//Esse Script é responsável por conter as funções gerais do jogador.

//função para câmera seguir o mouse sem tirar o personagem do foco
function CameraFollow(){
	//Pegando valores de largura e altura da câmera
	var cam_w = camera_get_view_width(view_camera[0]);
	var cam_h = camera_get_view_height(view_camera[0]);
	
	//clamp: limita a área em que a câmera vai exibir; 
	//lerp: pega um ponto médio da distância entre o mouse e a posição do personagem.
	
	/*Função descrita: Limite o valor máximo da posição do foco da câmera entre o X do mouse, o X 
	do jogador e o tamanho da cena menos o tamanho da câmera*/
	var cam_x = clamp(lerp(x, mouse_x, 0.2/*<- para alterar o limite de viagem da câmera, altere esse valor*/) - cam_w/2, 0, room_width - cam_w);
	var cam_y = clamp(lerp(y, mouse_y, 0.2/*<- para alterar o limite de viagem da câmera, altere esse valor*/) - cam_h/2, 0, room_height - cam_h);

	//Definindo posição da camera
	if state = StateDeath{
		//Defina o foco da câmera entre o X do jogador e o X da câmera, o mesmo para o Y.
		camera_set_view_pos(view_camera[0], x - cam_w/2, y - cam_h/2);
	}
	
	else{
		camera_set_view_pos(view_camera[0], cam_x, cam_y);
	}
}

//Função de cáclculo de decisão das animações do personagem
function calcDir(){
	//função responsável por calcular, dentro dos quadrantes do círculo trigonométrico, o quadrante da movimentação do player
	if dir >= 330 || dir <= 30{
		trueDir = 1;	
	}
		
	else if dir > 30 && dir <= 60{
		trueDir = 2;
	}
		
	else if dir > 60 && dir <=120{
		trueDir = 3;	
	}
	
	else if dir > 120 && dir <= 150{
		trueDir = 4;	
	}
	
	else if dir > 150 && dir <= 210{
		trueDir = 5;	
	}
	
	else if dir > 210 && dir <= 225{
		trueDir = 6;	
	}
	
	else if dir > 225 && dir <= 300{
		trueDir = 7	
	}
	
	else if dir > 300 && dir < 330{
		trueDir = 8;
	}
}
	
//Função de colisões (possível alteração)
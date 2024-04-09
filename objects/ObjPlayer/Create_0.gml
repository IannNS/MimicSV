//Variaveis de log
logVar = noone;

//Variaveis de efeitos visuais
alpha = 0;
color = #ffffff;

//Variaveis de movimentação e animação
wlkSpeed = 1.5;
hfacing = 1;
dir = 0;
trueDir = 0;

//Variaveis da layer de screenshake
screenShakePar = layer_get_fx("ScreenShake");

//Particula trilha de passos
canCreateDust = true;
partSystem = part_system_create();
movPart = part_type_create();
movPartEmitter = part_emitter_create(partSystem);

part_type_shape(movPart, pt_shape_cloud);
part_type_color1(movPart, #ccb687);
part_type_alpha2(movPart, 1, 0);
part_type_size(movPart, 0.1, 0.2, 0, 0);
part_type_speed(movPart, 0.01, 0.02, 0, 0);
part_type_direction(movPart, 70, 110, 0, 0);
part_type_orientation(movPart, 0, 360, 1, 0, 0);
part_type_life(movPart, 20, 30);
			
//Variaveis de esquiva
dodgeDir = -1;
dodgeSpeed = 3;

maxDodgeEnergy = 100;
dodgeEnergy = maxDodgeEnergy;

//Variaveis de combate
attackDir = 0;
comboCount = 0;

//Variaveis de vida
global.maxLife = 4;
global.currentLife = global.maxLife;
global.nextLife = global.currentLife;

//Variaveis Rage (habilidades)
global.maxRage = 100;
global.currentRage = global.maxRage;
global.nextRage = global.currentRage;

state = StateFree;

//função para câmera seguir o mouse sem tirar o personagem do foco

function CameraFollow(){
	//Pegando valores de largura e altura da câmera
	var cam_w = camera_get_view_width(view_camera[0]);
	var cam_h = camera_get_view_height(view_camera[0]);
	
	//clamp: limita a área em que a câmera vai exibir; 
	//lerp: pega um ponto médio da distância entre o mouse e a posição do personagem.
	
	/*Função descrita: Limite o valor máximo da posição do foco da câmera entre o X do mouse, o X 
	do jogador e o tamanho da cena menos o tamanho da câmera*/
	var cam_x = clamp(lerp(x, mouse_x, 0.3) - cam_w/2, 0, room_width - cam_w);
	var cam_y = clamp(lerp(y, mouse_y, 0.3) - cam_h/2, 0, room_height - cam_h);

	//Definindo posição da camera
	if state = StateDeath{
		//Defina o foco da câmera entre o X do jogador e o X da câmera, o mesmo para o Y.
		camera_set_view_pos(view_camera[0], x - cam_w/2, y - cam_h/2);
	}
	
	else{
		camera_set_view_pos(view_camera[0], cam_x, cam_y);
	}
}

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


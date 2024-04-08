//Variaveis de log
logVar = noone;

//Variaveis de efeitos visuais
alpha = 0;
color = #ffffff;

//Variaveis de movimentação e animação
wlkSpeed = 1.5;
hfacing = 1;
dir = 0;

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

	//Pegando valores do mouse e fazendo calculo de limite onde a câmera pode atuar
	//clamp: limita a área em que a câmera vai exibir; 
	//lerp: pega um ponto médio da distância entre o mouse e a posição do personagem.
	var cam_x = clamp(lerp(x, mouse_x, 0.3) - cam_w/2, 0, room_width - cam_w);
	var cam_y = clamp(lerp(y, mouse_y, 0.3) - cam_h/2, 0, room_height - cam_h);

	//Definindo posição da camera
	if state = StateDeath{
		camera_set_view_pos(view_camera[0], x - cam_w/2, y - cam_h/2);
	}
	
	else{
		camera_set_view_pos(view_camera[0], cam_x, cam_y);
	}
}


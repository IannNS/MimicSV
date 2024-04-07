//Define profundidade das camadas de efeito do mundo, constantemente (para evitar erros)
layer_depth("Vignhet", -room_height)
layer_depth("ScreenShake", -room_height);

//Chamando a função para a câmera seguir
CameraFollow();

//Definição de profundidade do personagem
depth = -y;

//Definição de teclas de movimentação
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

//Excecuta os scripts de estado do personagem
script_execute(state);

//Função de criação de párticulas de movimentação
if ((xprevious != x or yprevious != y) and canCreateDust = true and ObjPlayer.state = StateFree){
	part_system_depth(partSystem, ObjPlayer.depth +2)
	canCreateDust = false;
	var randomTime = irandom_range(-1, 2);
	alarm_set(4, 8 + randomTime);
	alarm[5] = 10;
}

//Função de recarregamento de Vigor
if alarm[1] <= 0{
	dodgeEnergy  += 1;
}

//Define o valor máximo de Vigor do personagem
dodgeEnergy = clamp(dodgeEnergy, 0, 100);

//Criação de variáveis de funções para testes
if keyboard_check_pressed(vk_f1){
	global.currentLife -= 1;
	alarm[6] = 30;
	fx_set_parameter(screenShakePar, "g_Magnitude", 2);
	layer_enable_fx("ScreenShake", true);
}

if keyboard_check_pressed(vk_f2){
	global.currentLife += 1;
}

logVar = fx_get_parameter(screenShakePar, "g_Magnitude");
show_debug_message(logVar);
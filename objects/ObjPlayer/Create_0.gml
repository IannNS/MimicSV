//Variaveis de log
alarm[9] = 50;
logVar = noone;

//Variaveis de target dos inimigos
lastSeenX = 0;
lastSeenY = 0;

//Variaveis de efeitos visuais
alpha = 0;
color = #ffffff;

//Variaveis de movimentação e animação
wlkSpeed = 1.5;
hfacing = 1;
dir = 0;
trueDir = 0;

//Variaveis de Sprite
spriteIdleSide = idleSide;
spriteIdleUp = idleUp;
spriteIdleDown = idleDown;

spriteWalkSide = walkSide;
spriteWalkUp = walkUp;
spriteWalkDown = walkDown;

spriteAttacksSide = comboSide1;
spriteAttacksDiagUp = comboDiagUp1;
spriteAttackUp = comboUp1;
spriteAttackDown = comboDown1;
spriteAttackDiagDown = comboDiagDown1;

deathSprite = sprDeathAnim;

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
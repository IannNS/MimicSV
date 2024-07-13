/// @description Inserir descrição aqui

//Alarme de decisão de direção no estado de idle
alarm[2] = 0;

//Criação dos caminhos do algoritmo A*
pathIdle = path_add();
pathToTarget = path_add();
pathBackToSpawn = path_add();
spawnDistance = 0;

//Variaveis para salvar aonde o player foi visto a última vez
lastSeenX = 0;
lastSeenY = 0;

//Variaveis de para aonde o jogador deve ir no estado de idle
xgo = 0;
ygo = 0;

//los = line of sight, para verificar se há visão com o jogador
los = false;
//distância até o jogador
playerDistance = 0;

//Jogador está próximo
playerClose = false;
//Jogador está próximo o suficiente para atacar
attackPlayer = false;

//Define ataque do inimigo
chooseAttack = 0;

state = StatePatrol;

//Inherit the parent event 
event_inherited();

attackReady = false;
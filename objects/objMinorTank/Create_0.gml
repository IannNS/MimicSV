/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

pathToTarget = path_add();
pathBackToSpawn = path_add();
spawnDistance = 0;

lastSeenX = 0;
lastSeenY = 0;

los = false;
playerDistance = 0;

hmovement = 0;
vmovement = 0;
wlkSpeed = 1;

playerClose = false;
attackPlayer = false;

state = StatePatrol;

// Inherit the parent event
event_inherited();
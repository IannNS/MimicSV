/// @description creating the grid

//tamanho da celula
cellSize = 16;

//Tamanho horizontal e vertical da celula
cellH = room_width div cellSize;
cellV = room_height div cellSize;

//Criação da grid
overallGrid = mp_grid_create(0, 0, cellH, cellV, cellSize, cellSize);
mp_grid_add_instances(overallGrid, objBasicWall, true);
mp_grid_add_instances(overallGrid, objPropFather, true);

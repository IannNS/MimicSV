//Mouse
window_set_cursor(cr_none);
cursor_sprite = sprMouse;
if(state = StateDeath){
	cursor_sprite = noone;
}
//Rage Bar
draw_healthbar(12, 25, 95, 35, global.currentRage, c_black, c_white, c_red, 0, false, false);

//Hud
draw_sprite_ext(sprPlayerHUD, 0, 10, 10, 2, 2, 0, c_white, 1);

//Life
var numberOfLifes = global.maxLife;

var xx = 12;
var yy = 12;

for(var index = 0; index < numberOfLifes; index++){
	if global.currentLife > index{
		draw_sprite_ext(sprLifeBar, 0, xx, yy, 2, 2, 0, c_white, 1);
		
		if global.currentLife = 1{
			draw_sprite_ext(sprLifeBar, 2, xx, yy, 2, 2, 0, c_white, 1);
		}
	}
	
	else{
		draw_sprite_ext(sprLifeBar, 1, xx, yy, 2, 2, 0, c_white, 1);
	}
	xx += 12;
}

if(global.paused = true){
	viewX = view_get_xport(0);
	viewY = view_get_yport(0);
	viewW = view_get_wport(0);
	viewH = view_get_hport(0);
	draw_set_alpha(0.5);
	draw_rectangle_color(viewX, viewY, viewW, viewH, c_gray, c_gray, c_gray, c_gray, false);
	draw_set_alpha(1);
	draw_text(view_wport/3, view_hport/2, "TESTE DE PAUSE");
}
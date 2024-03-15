//Mouse
window_set_cursor(cr_none);
cursor_sprite = sprMouse;

//Rage Bar
draw_healthbar(12, 25, 95, 35, global.maxRage, c_black, c_white, c_red, 0, false, false);

//Hud
draw_sprite_ext(sprPlayerHUD, 0, 10, 10, 2, 2, 0, c_white, 1);

//Life
var numberOfBars = global.maxLife;

var xx = 12;
var yy = 12;

for(var index = 0; index < numberOfBars; index++){
	if(global.currentLife > index){
		draw_sprite_ext(sprLifeBar, 0, xx, yy, 2, 2, 0, c_white, 1);
	}
	
	else{
		draw_sprite_ext(sprLifeBar, 1, xx, yy, 2, 2, 0, c_white, 1);
	}
	
	xx += 12;
}
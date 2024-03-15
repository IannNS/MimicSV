enum states {
	OUT, 
	IN
}
state = states.OUT;

spr = transitionSprite;
sprw = sprite_get_width(spr);
sprh = sprite_get_height(spr);

xmax = room_width div sprw;
ymax = room_height div sprh;
imax = sprite_get_number(spr);

subImageIncriment  = sprite_get_speed(spr) / room_speed;
subImageIndex = 0;

col = c_black;
targetRoom = noone;
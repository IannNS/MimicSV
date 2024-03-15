for (var yy = 0; yy <= ymax; ++yy) {
    for (var xx = 0; xx <= xmax; ++xx) {
		draw_sprite_ext(spr, min(max(0, subImageIndex - xx), imax - 1), xx * sprw, yy * sprh, 1, 1, 0, col, 1);
	}
}

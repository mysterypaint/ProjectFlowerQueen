/// @description Init slope data
if (state == GameStates.TILEMAP_INIT) {
	draw_set_font(font);
	draw_tilemap(tilemap_id, 0, 0);
	for (var _i = heights_to_get-1; _i >= 0; _i--) {
		var _check = 0;
		while (_check <= TILE_SIZE) {
			global.heights[_i] = _check;
			if (_check == TILE_SIZE)
				break;
			if (surface_getpixel(application_surface, _i, _check,) != c_black)
				break;
			_check++;
		}
	}
	layer_tilemap_destroy(tilemap_id);
	
	state = GameStates.GAMEPLAY;
}
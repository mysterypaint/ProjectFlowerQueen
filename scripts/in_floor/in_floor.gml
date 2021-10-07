/// @description Checks to see if position is below the floor height of a given tile; Returns how deep in floor
/// @arg tilemap
/// @arg x
/// @arg y

var _pos = tilemap_get_at_pixel(argument0, argument1, argument2);
//tile_get_index(_pos);

if (_pos > 0) {
	if (_pos == 1)
		return (argument2 mod TILE_SIZE);
	var _the_floor = global.heights[(argument1 mod TILE_SIZE) + (_pos * TILE_SIZE)];
	return ((argument2 mod TILE_SIZE) - _the_floor);
} else return -(TILE_SIZE - (argument2 mod TILE_SIZE));
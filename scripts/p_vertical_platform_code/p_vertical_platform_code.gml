if (moving_platform_id != noone) {
	grounded = true;
	vsp = 0;
	y = moving_platform_id.bbox_top;
}
		
if (dash_timer > dash_cooldown || was_dashing) {
	hsp = facing_x * dash_speed;
	was_dashing = true;
}
		
// Jump
if (Game.key_jump_pressed) {
	vsp = jump_speed;
	_vsp_final = jump_speed;
	grounded = false;
	state = PlayerStates.JUMPING;
}
	
// Dash
if (Game.key_dash_pressed) {
	if (dash_timer <= 0) {
		dash_timer = dash_timer_max + dash_cooldown;
		state = PlayerStates.DASHING;
	}
}
		
		
var _hsp_final = hsp + hsp_carry;
var _tmap = Game.tilemap;
// Horizontal collision (Wall Entities)
if (place_meeting(x + _hsp_final, y-1, ParentWall)) {
	while (!place_meeting(x + sign(_hsp_final), y-1, ParentWall)) {
		x += sign(_hsp_final);
	}
	_hsp_final = 0;
	hsp = 0;
}
// Horizontal collision (Tiles&Slopes)
var _bbox_side, _p1, _p2;

if (_hsp_final > 0) _bbox_side = bbox_right; else _bbox_side = bbox_left;
_p1 = tilemap_get_at_pixel(_tmap, _bbox_side+_hsp_final, bbox_top);
_p2 = tilemap_get_at_pixel(_tmap, _bbox_side+_hsp_final, bbox_bottom);
if (tilemap_get_at_pixel(_tmap, x, bbox_bottom) > 1) _p2 = 0; // Ignore bottom side tiles if on a slope
if ((_p1 == 1) || _p2 == 1) { // Inside a tile with collision
	if (_hsp_final > 0)
		x = x - (x mod TILE_SIZE) + (TILE_SIZE - 1) - (bbox_right - x);
	else
		x = x - (x mod TILE_SIZE) - (bbox_left - x);
	_hsp_final = 0;
	hsp = 0;
}

x += _hsp_final;
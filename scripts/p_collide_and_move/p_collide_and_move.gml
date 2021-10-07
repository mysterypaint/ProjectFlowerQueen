// Calculate movement
if (vsp < grav_cap) {
	vsp += grav;
} else
	vsp = grav_cap;

var _tmap = Game.tilemap;

// Is my middle-center touching the floor at the start of this frame?
grounded = (in_floor(_tmap, x, bbox_bottom+1) >= 0);

if (dash_timer > dash_cooldown || was_dashing) {
	hsp = facing_x * dash_speed;
	was_dashing = true;
}

// Account for hsp/vsp adjustments
var _hsp_final = hsp + hsp_carry;
hsp_carry = 0;
var _vsp_final = vsp;// + vsp_carry;
vsp_carry = 0;

// Horizontal collision (Wall Entities)
if (place_meeting(x + _hsp_final, y, ParentWall)) {
	while (!place_meeting(x + sign(_hsp_final), y, ParentWall)) {
		x += sign(_hsp_final);
	}
	_hsp_final = 0;
	hsp = 0;
}

// Vertical collision (Wall Entities)
if (place_meeting(x, y + _vsp_final + 1, ParentWall)) {
	while (!place_meeting(x, y + sign(_vsp_final) + 1, ParentWall)) {
		y += sign(_vsp_final);
	}
	_vsp_final = 0;
	vsp = 0;
	grounded = true;
	//state = PlayerStates.IDLE;
}


if (grounded || (in_floor(_tmap, bbox_left, bbox_bottom+1) >= 0) || (in_floor(_tmap, bbox_right, bbox_bottom+1) >= 0)) {
	// Jump
	if (Game.key_jump_pressed) {
		vsp = jump_speed;
		_vsp_final = jump_speed;
		grounded = false;
		state = PlayerStates.JUMPING;
	}
	
	// Dash
	if (Game.key_dash_pressed && state != PlayerStates.ATTACKING) {
		if (dash_timer <= 0) {
			dash_timer = dash_timer_max + dash_cooldown;
			state = PlayerStates.DASHING;
		}
	}
}

// Re-apply fractions
_hsp_final += hsp_frac;
_vsp_final += vsp_frac;

// Store and remove fractions
// Important: Go into collision with whole integers ONLY!
hsp_frac = _hsp_final - (floor(abs(_hsp_final)) * sign(_hsp_final));
_hsp_final -= hsp_frac;
vsp_frac = _vsp_final - (floor(abs(_vsp_final)) * sign(_vsp_final));
_vsp_final -= vsp_frac;

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

// Vertical collision (Tiles&Slopes)
if (tilemap_get_at_pixel(_tmap, x, bbox_bottom + _vsp_final) <= 1) {
	if (_vsp_final >= 0) _bbox_side = bbox_bottom; else _bbox_side = bbox_top;
	_p1 = tilemap_get_at_pixel(_tmap, bbox_left, _bbox_side+_vsp_final);
	_p2 = tilemap_get_at_pixel(_tmap, bbox_right, _bbox_side+_vsp_final);
	if ((_p1 == 1) || (_p2 == 1)) {
		if (_vsp_final >= 0)
			y = y - (y mod TILE_SIZE) + (TILE_SIZE-1) - (bbox_bottom - y);
		else
			y = y - (y mod TILE_SIZE) - (bbox_top - y);
		_vsp_final = 0;
		vsp = 0;
	}
}


var _floor_dist = in_floor(_tmap, x, bbox_bottom + _vsp_final);
if (_floor_dist >= 0) {
	y += _vsp_final;
	y -= (_floor_dist + 1);
	_vsp_final = 0;
	vsp = 0;
	_floor_dist = -1;
}

y += _vsp_final;

// Walk down slopes
if (grounded) {
	was_dashing = false;
	
	y += abs(_floor_dist) - 1;
	
	if ((bbox_bottom mod TILE_SIZE) == TILE_SIZE - 1) { // If at base of current tile
		if (tilemap_get_at_pixel(_tmap, x, bbox_bottom+1) > 1) { // If the slope continues
			// Move there
			y += abs(in_floor(_tmap, x, bbox_bottom + 1));
		}
	}
}

// Move with vertical platforms
if (moving_platform_id != noone) {
	if (!moving_platform_id.horizontal_platform) {
		y += moving_platform_id.vsp;
		grounded = true;
		vsp = 0;
	}
}
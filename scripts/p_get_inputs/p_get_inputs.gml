hsp += Game.input_x * hsp_acc;

if (Game.input_x == 0) {
	var _hsp_fric_final = hsp_fric_ground;
	if (!grounded)
		_hsp_fric_final = hsp_fric_air;
	hsp = math_approach(hsp, 0, _hsp_fric_final);
}
hsp = clamp(hsp, -hsp_walk, hsp_walk);
/// @description Insert description here
mask_index = sprMovingPlatform
if (horizontal_platform) { // This is a horizontally-moving platform

	hsp = dir * move_speed;

	if (place_meeting(x + hsp, y, EntityWall)) {
		while (!place_meeting(x + sign(hsp), y, EntityWall)) {
			x += sign(hsp);
		}
		hsp = 0;
		dir *= -1;
	}
	x += hsp;
	
	if (instance_exists(Player)) {
		if ((round(Player.y) > y) || Game.input_y == 1 || Player.state == PlayerStates.VERT_PLATFORM) {
			mask_index = -1;
		} else {
			mask_index = sprMovingPlatform;
			if (place_meeting(x, y - 1, Player)) {
				Player.hsp_carry = hsp;
				Player.state = PlayerStates.HORIZ_PLATFORM;
			}
		}
	}
} else { // This is a vertically-moving platform
	vsp = dir * move_speed;

	if (place_meeting(x, y + vsp, EntityWall)) {
		while (!place_meeting(x, y + sign(vsp), EntityWall)) {
			y += sign(vsp);
		}
		vsp = 0;
		dir *= -1;
	}
	y += vsp;
	
	if (instance_exists(Player)) {
		if ((round(Player.y) > y) || Game.input_y == 1 || Player.state == PlayerStates.HORIZ_PLATFORM) {
			mask_index = -1;
		} else {
			mask_index = sprMovingPlatform;
			//if (place_meeting(x, y - 1, Player)) {
			//	Player.vsp_carry = vsp;
			//	Player.grounded = true;
			//	//Player.state = PlayerStates.VERTICAL_MOVING_PLATFORM;
			//}
		}
	}
}
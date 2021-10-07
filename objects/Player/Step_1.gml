/// @description Insert description here
moving_platform_id = instance_place(x, y + vsp, MovingPlatform);
if (moving_platform_id != noone) {
	if (!moving_platform_id.horizontal_platform) {
		//show_message("ok")
		grounded = true;
		y = moving_platform_id.bbox_top-1;
		vsp = 0;// moving_platform_id.vsp;
		state = PlayerStates.VERT_PLATFORM;
	} else {
		state = PlayerStates.HORIZ_PLATFORM;
	}
}
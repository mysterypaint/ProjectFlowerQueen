/// @description Insert description here
if (instance_exists(Player)) {
	if ((round(Player.y) > y) || Game.input_y == 1) {
		mask_index = -1;
	} else {
		mask_index = sprOneWayPlatform;
	}
}
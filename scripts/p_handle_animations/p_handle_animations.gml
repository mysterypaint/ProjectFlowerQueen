// Handle animations
if (grounded) {
	if (hsp != 0) {
		spr_index = spr_walk;
		state = PlayerStates.WALKING;
		image_speed = 1.2;
		facing_x = sign(hsp);
		image_xscale = facing_x;
	} else if (hsp == 0) {
		spr_index = spr_idle;
		state = PlayerStates.IDLE;
		image_speed = 0.6;
	}
} else { // The player must be up in the air
	if (vsp > 0) {
		spr_index = spr_fall;
		state = PlayerStates.FALLING;
		image_speed = 1.2;
	} else {
		spr_index = spr_jump;
		state = PlayerStates.JUMPING;
		image_speed = 1.2;
	}
}

if (dash_timer > dash_cooldown) {
	spr_index = sprPlayerDash
	state = PlayerStates.DASHING;
	image_speed = 1.2;
}

if (attacking_timer > 16) {
	spr_index = spr_melee;
	state = PlayerStates.ATTACKING;
	if (image_index == image_number - 1)
		image_speed = 0;
	else
		image_speed = 1.2;
} else if (attacking_timer > 9) {
	spr_index = spr_melee;
	state = PlayerStates.ATTACKING;
	image_speed = 0;
	image_index = image_number - 1;
}
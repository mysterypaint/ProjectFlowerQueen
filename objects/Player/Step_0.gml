/// @description Insert description here

// Handle animations
if (hsp != 0) {
	facing_x = sign(hsp);
}

image_xscale = facing_x;

switch (state) {
	default:
	case PlayerStates.IDLE:
	case PlayerStates.WALKING:
	case PlayerStates.JUMPING:
	case PlayerStates.FALLING:
	case PlayerStates.HORIZ_PLATFORM:
		p_get_inputs();
		p_collide_and_move();
		p_attack_code();
		p_handle_animations();
		break;
	case PlayerStates.DASHING:
	case PlayerStates.ATTACKING:
		p_collide_and_move();
		p_attack_code();
		p_handle_animations();
		break;
	case PlayerStates.VERT_PLATFORM:
		p_get_inputs();
		p_vertical_platform_code();
		p_attack_code();
		p_handle_animations();
		break;
}


if (dash_timer > 0)
	dash_timer -= Game.dt;

if (sprite_index != spr_index) {
	sprite_index = spr_index;
	image_index = 0;
}

if (mouse_check_button(mb_left)) {
	x = mouse_x;
	y = mouse_y;
}
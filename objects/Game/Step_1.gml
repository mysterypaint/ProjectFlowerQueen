/// @description Insert description here
input_x = (
			-max(keyboard_check(key_left), keyboard_check(key_left_alt), 0) +
			 max(keyboard_check(key_right), keyboard_check(key_right_alt), 0)
		  );

input_y = (
			-max(keyboard_check(key_up), keyboard_check(key_up_alt), 0) +
			 max(keyboard_check(key_down), keyboard_check(key_down_alt), 0)
		  );



key_jump_pressed = max(keyboard_check_pressed(key_jump), keyboard_check_pressed(key_jump_alt), 0);
key_dash_pressed = max(keyboard_check_pressed(key_dash), keyboard_check_pressed(key_dash_alt), 0);
key_attack_pressed = max(keyboard_check_pressed(key_attack), keyboard_check_pressed(key_attack_alt), 0);
/// @description Insert description here
switch (state) {
	case GameStates.INIT:
		camera = instance_create_depth(0, 0, 0, Camera);
		player = instance_create_depth(50, 50, 0, Player);
		state = GameStates.TILEMAP_INIT;
		break;
	default:
	case GameStates.GAMEPLAY:
		
		break;
}

if (keyboard_check_pressed(vk_escape))
	game_end();

ticks++;
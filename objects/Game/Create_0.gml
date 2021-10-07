/// @description Init vars
state = GameStates.INIT;
ticks = 0;
dt = 1;

camera = noone;
player = noone;

// Window resolution
win_width = 320;
win_height = 180;
win_size = 5;
window_set_size(win_width * win_size, win_height * win_size);
alarm[0] = 1; // Force the game to re-center its window 1 frame later

// Controller inputs
key_up = vk_up;
key_up_alt = ord("W");
key_down = vk_down;
key_down_alt = ord("S");
key_left = vk_left;
key_left_alt = ord("A");
key_right = vk_right;
key_right_alt = ord("D");

key_jump = ord("Z");
key_jump_alt = ord("K");

key_attack = ord("X");
key_attack_alt = ord("J");

key_dash = ord("L");
key_dash_alt = ord("C");

input_x = 0;
input_y = 0;

key_jump_pressed = false;

// Tiles
heights_to_get = sprite_get_width(sprCol);
tiles = heights_to_get / TILE_SIZE;

tilemap = layer_tilemap_get_id("Collision");
var _layer_id = layer_create(0, "Tiles");
tilemap_id = layer_tilemap_create(_layer_id, 0, 0, tCollision, tiles, 1);

for (var _i = 0; _i < tiles; _i++) {
	tilemap_set(tilemap_id, _i, _i, 0);
}

// Text
font = font_add_sprite(sprFont, ord("!"), true, 1);

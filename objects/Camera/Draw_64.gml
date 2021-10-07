/// @description Insert description here
var _str = "Player State: " + print_player_state()
+ "\nGrounded: " + print_bool(Player.grounded)
+ "\nDash Timer: " + string(Player.dash_timer)
+ "\nCan Dash: " + print_bool(Player.dash_timer <= 0);
draw_text(0, 0, _str);
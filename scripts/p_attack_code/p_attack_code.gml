if (state != PlayerStates.ATTACKING) {
	if (Game.key_attack_pressed && state != PlayerStates.DASHING) {
		attacking_timer = attacking_timer_max;
	}
} else {
	// Attacking code
	if (attacking_timer <= 0) {
		attacking_timer = 0;
		state = PlayerStates.IDLE;
	}
}

if (attacking_timer > 0)
	attacking_timer -= Game.dt;
else
	attacking_timer = 0;
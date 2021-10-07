/// @description Insert description here
enum PlayerStates {
	IDLE,
	WALKING,
	DASHING,
	GROUNDED,
	JUMPING,
	FALLING,
	ATTACKING,
	HORIZ_PLATFORM,
	VERT_PLATFORM,
	MAX
};

state = PlayerStates.IDLE;

hsp = 0;
vsp = 0;
hsp_frac = 0;
vsp_frac = 0;

hsp_acc = 1;
hsp_fric_ground = 0.50;
hsp_fric_air = 0.15;
hsp_walk = 2;


// Jumping
grounded = false;
grav = 0.5;
grav_cap = 6;
jump_speed = -7;
was_dashing = false;

// Dashing
dash_speed = 3;
dash_timer = 0;
dash_timer_max = 30;
dash_cooldown = 15;

// Attacking
attacking_timer = 0;
attacking_timer_max = 30;
attacking_timer_retract = 50;

// Moving platforms
moving_platform_id = noone;
hsp_carry = 0;
vsp_carry = 0;

// Animation handling
spr_idle = sprPlayerIdle;
spr_walk = sprPlayerWalk;
spr_jump = sprPlayerJump;
spr_fall = sprPlayerFall;
spr_dash = sprPlayerDash;
spr_melee = sprPlayerMelee;

spr_index = spr_idle;

facing_x = 1;
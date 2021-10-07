var _str = "Unknown";
switch(Player.state) {
	default:
	case PlayerStates.IDLE:
		_str = "Idle";
		break;
	case PlayerStates.WALKING:
		_str = "Walking";
		break;
	case PlayerStates.JUMPING:
		_str = "Jumping";
		break;
	case PlayerStates.FALLING:
		_str = "Falling";
		break;
	case PlayerStates.DASHING:
		_str = "Dashing";
		break;
	case PlayerStates.ATTACKING:
		_str = "Attacking";
		break;
	case PlayerStates.GROUNDED:
		_str = "Grounded";
		break;
	case PlayerStates.HORIZ_PLATFORM:
		_str = "Horiz. Platform";
		break;
	case PlayerStates.VERT_PLATFORM:
		_str = "Vert. Platform";
		break;
}

return _str;
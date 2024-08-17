

	var _target_x = end_x, _target_y = end_y
	
	// target
	if (going_to_start)
	{
		_target_x = start_x
		_target_y = start_y
	}
	
	// set movement
	xspd = sign(_target_x - x) * current_spd
	yspd = sign(_target_y - y) * current_spd
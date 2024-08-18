

	var _target_x = end_x, _target_y = end_y
	
	// target
	if (going_to_start)
	{
		_target_x = start_x
		_target_y = start_y
	}
	
	// set movement
	if (activated)
	{
		image_blend = c_lime
		xspd = sign(_target_x - x) * current_spd
		yspd = sign(_target_y - y) * current_spd
	}
	else
	{
		image_blend = c_white
		xspd = 0
		yspd = 0
	}
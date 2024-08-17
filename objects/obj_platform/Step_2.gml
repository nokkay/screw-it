///@desc move 

	x += xspd
	y += yspd
	
	// check if at start pos
	if (going_to_start && point_distance(x,y, start_x, start_y) < current_spd)
	{
		going_to_start = false
		current_spd = 0
		alarm[0] = wait_time
 	}
	// check if at end pos
	else if (!going_to_start && point_distance(x,y, end_x, end_y) < current_spd)
	{
		going_to_start = true
		current_spd = 0
		alarm[0] = wait_time
	}
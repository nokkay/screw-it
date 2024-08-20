///@desc move towards target

	x += xspd
	y += yspd
	
	// sounds
	if (xspd != 0 or yspd != 0)
	{
		play_sound(snd_flying_platforms_stationary, -1,false)	
	}
	
	if (xspd == 0 && yspd == 0)
	{
		audio_stop_sound(snd_flying_platforms_stationary)
	}
	
	// check if at start pos
	if (going_to_start && point_distance(x,y, start_x, start_y) < current_spd)
	{
		going_to_start = false
		current_spd = 0
		last_activated = activated
 	}
	// check if at end pos
	else if (!going_to_start && point_distance(x,y, end_x, end_y) < current_spd)
	{
		going_to_start = true
		current_spd = 0
		last_activated = activated
	}

	// if activation change has changed at the end points, then set spd and move again
	if (last_activated != activated) current_spd = puzzle_platform_spd
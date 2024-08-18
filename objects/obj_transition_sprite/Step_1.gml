/// @description Progress Transition
	

	
	if (local_reached_end)
	{
		if (room == rm_intro)room_goto(room_next(room))
		leading = IN
	}
	
	if (leading == OUT)
	{
		percent = min(percent + TRANSITION_SPEED, 1)
		if (percent >= 1) // screen fully obscured
		{
			// update variables in obj_intro
			with (obj_intro)
			{
				if (sprite_current < sprite_number - 1) sprite_current++
				else {reached_end = true; other.local_reached_end = true}
				local_frame = 0
			}
			if (!local_reached_end) leading = IN
		}
	}
	// dont play in if we have reached the end
	else// leading == IN
	{
		percent = max(0, percent-TRANSITION_SPEED)
		if (percent <= 0) // screen fully revealed
		{
			draw_set_alpha(1)
			instance_destroy()
		}
	}

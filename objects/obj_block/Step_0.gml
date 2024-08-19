
	// Final movement velocity
	_final_xspd = xspd
	_final_yspd = yspd
	
	
	with (obj_player) 
	{
		// pushing
		if (bbox_left == other.bbox_right && place_meeting(x + _final_xspd,y,obj_block))
		{
			show_debug_message("player pushing box from right")
			other._final_xspd = _final_xspd 
		}
		if (bbox_right == other.bbox_left && place_meeting(x + _final_xspd,y,obj_block)) 
		{
			show_debug_message("player pushing box from left")
			other._final_xspd = _final_xspd 
		}
		
		// disable grabbable if player is on top
		if (bbox_bottom == other.bbox_top)
		{
			show_debug_message("player is on top")
			other._final_yxspd = 0
		}
		
	}
	
	
	

	// Moving platform collision
	var _platform = instance_place(x, y + max(1, _final_yspd), obj_platform)
	if (_platform && bbox_bottom <= _platform.bbox_top) 
	{
		// Pixel-perfect collisions
		if (_final_yspd > 0) 
		{
			while (!place_meeting(x, y + sign(_final_yspd), obj_platform)) 
			{
				y += sign(_final_yspd)
			}
			_final_yspd = 0
			yspd = 0 // gravity is reset too
			on_platform = true
		}
	
		// Add velocity
		_final_xspd += _platform.xspd
		_final_yspd += _platform.yspd
	}
	else on_platform = false


	// X collisions
	if (place_meeting(x + _final_xspd, y, obj_collision)) 
	{
		while (!place_meeting(x + sign(_final_xspd), y, obj_collision))
		{
			x += sign(_final_xspd)
		}
	
		_final_xspd = 0
	}

	// Y collisions
	if (place_meeting(x, y + _final_yspd, obj_collision))
	{
		while (!place_meeting(x, y + sign(_final_yspd), obj_collision)) 
		{
			y += sign(_final_yspd)
		}
	
		_final_yspd = 0
		yspd = 0 // gravity is reset too
		on_ground = true
	}
	else on_ground = false
	
	
	
	// move
	x += _final_xspd
	y += _final_yspd

	// gravity
	if (yspd < grav) 
	{
		yspd += grav_accel;
	}



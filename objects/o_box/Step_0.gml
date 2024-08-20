
	event_inherited()
	
	// collision with moving platform
	
	// Moving platform collision
	var _platform = instance_place(x, y + max(1, YVelocity), obj_platform)
	if (_platform && bbox_bottom <= _platform.bbox_top) 
	{
		// Pixel-perfect collisions
		if (YVelocity > 0) 
		{
			while (!place_meeting(x, y + sign(YVelocity), obj_platform)) 
			{
				y += sign(YVelocity)
			}
			YVelocity = 0
			on_platform = true
		}
	
		// Add velocity
		XVelocity += _platform.xspd
		YVelocity += _platform.yspd
	}
	else on_platform = false


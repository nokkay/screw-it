
function player_collisions()
{
	// horizontal movement
	xdir = global.key_right - global.key_left
	xspd = xdir * move_spd
	

	// Final movement velocity
	_final_xspd = xspd
	_final_yspd = yspd

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

	/// collisions
	// X
	if (place_meeting(x + _final_xspd, y, obj_collision)) 
	{
		while (!place_meeting(x + sign(_final_xspd), y, obj_collision))
		{
			x += sign(_final_xspd)
		}
	
		_final_xspd = 0
	}

	// Y
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

}

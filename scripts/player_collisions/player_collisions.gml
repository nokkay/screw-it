
function player_collisions()
{
	// horizontal movement
	xdir = global.key_right - global.key_left
	xspd = xdir * move_spd
	
	if (noclip) // debugging
	{
		x += (global.key_right - global.key_left) * 20
		y += (global.key_down - global.key_up) * 20
		return
	}

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


	// x wall/floor collisions
	if (place_meeting(x + _final_xspd, y, obj_collision)) 
	{
		while (!place_meeting(x + sign(_final_xspd), y, obj_collision))
		{
			x += sign(_final_xspd)
		}
	
		_final_xspd = 0
	}

	// y wall/floor collisions
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
	
	//  on top of box collision
	var _box_y = instance_place(x, y + max(1, _final_yspd), o_box)
	if (_box_y && bbox_bottom <= _box_y.bbox_top) 
	{
		// Pixel-perfect collisions
		if (_final_yspd > 0) 
		{
			while (!place_meeting(x, y + sign(_final_yspd), o_box)) 
			{
				y += sign(_final_yspd)
			}
			_final_yspd = 0
			yspd = 0 // gravity is reset too
			on_box = true
		}
	
		// Add velocity
		_final_xspd += _box_y.XVelocity
		_final_yspd += _box_y.YVelocity
	}
	else on_box = false
	

	// Horizontal collision with o_box
	var _block_x = instance_place(x + _final_xspd, y, o_box);

	if (_block_x != noone) 
	{
	    // right edge of player touches left edge of box
	    if (_final_xspd > 0 && bbox_right >= _block_x.bbox_left && bbox_left < _block_x.bbox_left) 
		{
	        while (!place_meeting(x + 1, y, o_box)) 
			{
	            x += 1;
	        }
	        _final_xspd = 0;
	    }

	    // left edge of player touches right edge of box
	    if (_final_xspd < 0 && bbox_left <= _block_x.bbox_right && bbox_right > _block_x.bbox_right) 
		{
	        while (!place_meeting(x - 1, y, o_box)) 
			{
	            x -= 1;
	        }
	        _final_xspd = 0;
	    }
	}
	//// y box collisions
	//var _box_y = instance_place(x, y + _final_yspd, o_box)
	//// make sure box exists, is not grabbed, and ignore colliisions if the player is trapped under it
	//if (_box_y && !_box_y.GrabbedBool && (bbox_bottom < _box_y.bbox_top + 1))
	//{
	//	while (!place_meeting(x, y + sign(_final_yspd), o_box)) 
	//	{
	//		y += sign(_final_yspd)
	//	}
	
	//	_final_yspd = 0
	//	yspd = 0 // gravity is reset too
	//	on_box = true
	//}
	//else on_box = false
	
	
	// move
	x += _final_xspd
	y += _final_yspd

	// gravity
	if (yspd < grav) 
	{
		yspd += grav_accel;
	}

}

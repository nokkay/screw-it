
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
	
	
	
	
	// x box collisions
	if (place_meeting(x + _final_xspd, y, o_box)) 
	{
		while (!place_meeting(x + sign(_final_xspd), y, o_box))
		{
			x += sign(_final_xspd)
		}
	
		_final_xspd = 0
	}

	// y box collisions
	if (place_meeting(x, y + _final_yspd, o_box))
	{
		while (!place_meeting(x, y + sign(_final_yspd), o_box)) 
		{
			y += sign(_final_yspd)
		}
	
		_final_yspd = 0
		yspd = 0 // gravity is reset too
		on_box = true
	}
	else on_box = false
	

	
	//// y blocks collisions
	//var _block_y = instance_place(x, y + max(1, _final_yspd), o_box)
	//if (_block_y && bbox_bottom <= _block_y.bbox_top) 
	//{
	//	var _times_to_try = 30
	//	var _tick = 0
	//	while (!place_meeting(x, y + sign(_final_yspd), o_box)) 
	//	{
	//		y += sign(_final_yspd)
			
	//		if (_tick < _times_to_try){_tick++}// show_debug_message($"tick: {_tick}")}
	//		else break
	//	}
	
	//	_final_yspd = 0
	//	yspd = 0 // gravity is reset too
	//	on_ground = true
	//}
	
	//// x block collisions
	//var _block_x = instance_place(x + _final_xspd, y, o_box);

	//if (_block_x != noone) 
	//{
	//    // Check if the player is about to collide with the box
	//    if (bbox_left < _block_x.bbox_right && bbox_right > _block_x.bbox_left) 
	//	{
	//        // Move the player pixel by pixel until a collision occurs
	//        while (!place_meeting(x + sign(_final_xspd), y, o_box)) 
	//		{
	//            x += sign(_final_xspd)
	//        }

	//        // Stop horizontal movement after collision
	//        _final_xspd = 0;
	//    }
	//}
	
	// move
	x += _final_xspd
	y += _final_yspd

	// gravity
	if (yspd < grav) 
	{
		yspd += grav_accel;
	}

}

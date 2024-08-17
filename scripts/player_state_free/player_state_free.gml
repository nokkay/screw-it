
function player_state_free()
{
		

	// Horizontal movement
	xdir = global.key_right - global.key_left
	xspd = xdir * move_spd

	// Jump
	if (global.key_jump && (place_meeting(x, y + 1, obj_collision) || place_meeting(x,y+1,obj_platform))) 
	{
		yspd = -jump_dist
	}

	// Final movement velocity
	var _final_xspd = xspd
	var _final_yspd = yspd

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
		}
	
		// Add velocity
		_final_xspd += _platform.xspd
		_final_yspd += _platform.yspd
	}

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
	}
	
	// Move
	x += _final_xspd
	y += _final_yspd

	// Gravity
	if (yspd < grav) {
		yspd += grav_accel;
	}
	
	// sprites
	if (sign(_final_xspd) > 0) image_xscale = 1
	if (sign(_final_xspd) < 0) image_xscale = -1
	 
	// on ground
	if (_final_yspd = 0)
	{
		if (_final_xspd == 0) sprite_index = spr_idle
		else sprite_index = spr_move
	}
	// in air
	else
	{
		if (_final_yspd < 0) sprite_index = spr_jump
		else sprite_index = spr_fall
	}
}



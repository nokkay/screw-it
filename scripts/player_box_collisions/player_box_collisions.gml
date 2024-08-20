
function player_box_collisions()
{
	
	// vriable to store the box the player is standing on
	if (!on_box)
	{
	    _current_box = noone
	}

	// o top of box collision
	var _box_y = instance_place(x, y + max(1, _final_yspd), o_box)
	on_box = false
	
	// break out of while loop if trapped
	var safety_check = 30

	if (_box_y != noone && !_box_y.GrabbedBool && bbox_bottom < _box_y.bbox_top + 3) 
	{
	    _current_box = _box_y // Update the current box reference
    
	    // pixel-perfect collisions
	    if (_final_yspd > 0) 
	    {
	        while (!place_meeting(x, y + sign(_final_yspd), o_box)) 
	        {
	            y += sign(_final_yspd)
				
				// break out 
				if (safety_check < 0) break
				safety_check--
	        }
	        _final_yspd = 0
	        yspd = 0 // gravity is reset too
	        on_box = true

	        // add velocity from this box
	        _final_xspd += _box_y.XVelocity
	        _final_yspd += _box_y.YVelocity
	    }
	} 
	else if (_current_box != noone) 
	{
	    // check if the player is still on the same box
	    if (bbox_bottom < _current_box.bbox_top + 3) 
	    {
	        if (_final_yspd > 0) 
	        {
	            while (!place_meeting(x, y + sign(_final_yspd), o_box)) 
	            {
	                y += sign(_final_yspd)
					// break out 
					if (safety_check < 0) break
					safety_check--
	            }
	            _final_yspd = 0
	            yspd = 0 // gravity is reset too
	            on_box = true
	        }

	        // add velocity from this box
	        _final_xspd += _current_box.XVelocity
	        _final_yspd += _current_box.YVelocity
	    }
	}
	
	// horizontal collision with o_box
	var _block_x = instance_place(x + _final_xspd, y, o_box)
	
	// break out of while loop if trapped
	var safety_check = 30

	if (_block_x != noone && _block_x != _current_box && !_block_x.GrabbedBool) 
	{
	    // right edge of player touches left edge of box
	    if (_final_xspd > 0 && bbox_right >= _block_x.bbox_left && bbox_left < _block_x.bbox_left) 
	    {
	        while (!place_meeting(x + 1, y, o_box)) 
	        {
	            x += 1
				if (safety_check < 0) break
				safety_check--
	        }
	        _final_xspd = 0
	    }

	    // left edge of player touches right edge of box
	    if (_final_xspd < 0 && bbox_left <= _block_x.bbox_right && bbox_right > _block_x.bbox_right) 
	    {
	        while (!place_meeting(x - 1, y, o_box)) 
	        {
	            x -= 1
				if (safety_check < 0) break
				safety_check--
	        }
	        _final_xspd = 0
	    }
	}

	
	
	
	
	
	// OLD

//  on top of box collision
	//var _box_y = instance_place(x, y + max(1, _final_yspd), o_box)
	//show_debug_message(_box_y && _box_y.GrabbedBool)
	//if (_box_y && bbox_bottom < _box_y.bbox_top + 3 && !_box_y.GrabbedBool) 
	//{
	//	// Pixel-perfect collisions
	//	if (_final_yspd > 0) 
	//	{
	//		while (!place_meeting(x, y + sign(_final_yspd), o_box)) 
	//		{
	//			y += sign(_final_yspd)
	//		}
	//		_final_yspd = 0
	//		yspd = 0 // gravity is reset too
	//		on_box = true
	//	}
	
	//	// Add velocity
	//	_final_xspd += _box_y.XVelocity
	//	_final_yspd += _box_y.YVelocity
	//}
	//else on_box = false
	

	//// Horizontal collision with o_box
	//var _box_x = instance_place(x + _final_xspd, y, o_box)

	//if (_box_x != noone && !_box_x.GrabbedBool) 
	//{
	//    // right edge of player touches left edge of box
	//    if (_final_xspd > 0 && bbox_right >= _box_x.bbox_left && bbox_left < _box_x.bbox_left) 
	//	{
	//        while (!place_meeting(x + 1, y, o_box)) 
	//		{
	//            x += 1
	//        }
	//        _final_xspd = 0
	//    }

	//    // left edge of player touches right edge of box
	//    if (_final_xspd < 0 && bbox_left <= _box_x.bbox_right && bbox_right > _box_x.bbox_right) 
	//	{
	//        while (!place_meeting(x - 1, y, o_box)) 
	//		{
	//            x -= 1
	//        }
	//        _final_xspd = 0
	//    }
	//}
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


}
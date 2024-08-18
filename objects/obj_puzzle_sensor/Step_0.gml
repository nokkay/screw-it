/// @desc Collide with puzzle block

	if (place_meeting(x,y,obj_puzzle_block))
	{
		image_index = 1	
		
		// send activation signal
		if (activate_id != -1)
		{
			activate_id.activated = true			
		}
	}
	else
	{
		image_index = 0
		if (activate_id != -1)
		{
			activate_id.activated = false	
		}	
	}
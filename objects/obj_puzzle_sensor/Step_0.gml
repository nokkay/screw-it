/// @desc Collide with puzzle block

	var _block = instance_place(x,y,obj_block)
	if (_block && _block.puzzle)
	{
		image_index = 1	
		show_debug_message(_block.puzzle)
		
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
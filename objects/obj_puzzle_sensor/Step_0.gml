/// @desc Collide with puzzle block

	if (player_enable)
	{
		var _player = instance_place(x,y,obj_player)
		if (_player)
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
	}
	
	var _box = instance_place(x,y,o_box)
	var _block = instance_place(x,y,obj_block)
	if ((_box && _box.puzzle) or (_block && _block.puzzle))
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
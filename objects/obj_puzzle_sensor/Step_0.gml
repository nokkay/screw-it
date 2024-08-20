/// @desc Collide with puzzle block

	var touching_activator = false

	if (player_enable)
	{
		var _player = instance_place(x,y,obj_player)
		if (_player)
		{
			image_index = 1	
			touching_activator = true
			// send activation signal
			if (activate_id != -1)
			{
				activate_id.activated = true			
			}
		}
	}

	
	var _box = instance_place(x,y,o_box)
	var _block = instance_place(x,y,obj_block)
	if ((_box && _box.puzzle) or (_block && _block.puzzle))
	{
		image_index = 1	
		touching_activator = true
		// send activation signal
		if (activate_id != -1)
		{
			activate_id.activated = true			
		}
	}

	// if not touching anything, show unpressed button and dont send signal
	if (!touching_activator)
	{
		image_index = 0
		if (activate_id != -1)
		{
			activate_id.activated = false	
		}	
	}

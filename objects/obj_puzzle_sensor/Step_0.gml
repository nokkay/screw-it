/// @desc Collide with puzzle block

	var touching_activator = false
	
	if (last_index != image_index && !instance_exists(obj_transition))
	{
		if (last_index == 0) play_sound(snd_switch_on,-1,false)	// on
		else play_sound(snd_switch_off,-1,false)	// off
	}
	
	// play_sound(snd_switch_on,-1,false)

	if (player_enable)
	{
		var _player = instance_place(x,y,obj_player)
		if (_player)
		{
			last_index = image_index
			image_index = 1	
			touching_activator = true
			last_state = true			// send activation signal
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
		last_index = image_index
		image_index = 1	
		last_state = true		touching_activator = true
		// send activation signal
		if (activate_id != -1)
		{
			activate_id.activated = true	
		}
	}

	// if not touching anything, show unpressed button and dont send signal
	if (!touching_activator)
	{
		last_index = image_index
		image_index = 0
		if (activate_id != -1)
		{
			activate_id.activated = false	
		}	
	}
	
	

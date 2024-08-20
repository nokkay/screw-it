
	// skip intro
	if (keyboard_check_pressed(vk_enter)) room_transition(transition_type,room_next(room))


	// make sure we dont go overbound of the array

	if (!reached_end)
	{
		// animate frame
		local_frame += sprite_get_speed(sprite_array[sprite_current]) / FRAME_RATE
		
		// check for any key press
		if (keyboard_check_pressed(vk_anykey) && !instance_exists(obj_transition_sprite))
		{
			
			with (instance_create_layer(0,0,"Instances",obj_transition_sprite))
			{
				if (other.transition_disable) visible = false
				type = other.transition_type
			}
		}
	}
	else
	{
		// start game
		with (instance_create_layer(0,0,"Instances",obj_transition_sprite))
		{
			visible = true
			type = other.transition_type
			local_reached_end = other.reached_end
		}
		//room_transition(transition_type,room_next(room))
	}
	
	

	
	
	
	

	
	
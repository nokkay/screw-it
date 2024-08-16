/// @description Cause a room transition


	if (instance_exists(obj_player)) && (position_meeting(obj_player.x,obj_player.y,id))
	{
			if (!instance_exists(obj_transition))
			{
				global.target_room = target_room
	 			global.target_x = target_x
				global.target_y = target_y
				global.target_dir = obj_player.image_xscale
				
				// activate sound 
				if (activate_sound != -1) play_sound_struct({sound:activate_sound,pitch:1},true,.1,false)
			
				// room transition 
				with (obj_player) state = player_state_transition 
				room_transition(transition_type, target_room)			
				instance_destroy()
			}
	}



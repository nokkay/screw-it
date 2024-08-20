///@desc player sounds


	switch (sprite_index)
	{
		
		case spr_player_move: // step on 1 or 3
	
			if (last_sprite != sprite_index) // sprites have changed
			{
				var _step_sound = asset_get_index("snd_steps"+string(irandom_range(1,5)))
				play_sound(_step_sound,.1,true)
				alarm[0] = step_time
			}
			else 

		break
		
		case spr_player_jump:
		break
		
		case spr_player_fall:
		break
		
		default:
		break
	}
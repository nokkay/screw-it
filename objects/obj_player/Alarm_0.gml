/// @desc walk soundsa

	if (sprite_index == spr_player_move)
	{
		var _step_sound = asset_get_index("snd_steps"+string(irandom_range(1,5)))
		play_sound(_step_sound,.1,true)
		alarm[0] = step_time
	}
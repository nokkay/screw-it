/// @description Progress Transition
	
if (!global.game_paused)
{

	if (leading == OUT)
	{
		percent = min(percent + TRANSITION_SPEED, 1)
		if (percent >= 1) // screen fully obscured
		{
			room_goto(target)	
			leading = IN
		}
	}
	else // leading == IN
	{
		percent = max(0, percent-TRANSITION_SPEED)
		if (percent <= 0) // screen fully revealed
		{
			//with (obj_player) state = player_state_free
			draw_set_alpha(1)
			instance_destroy()
		}
	}
}
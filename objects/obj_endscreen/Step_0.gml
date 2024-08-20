
	// key press to restart game
	if (key_pressed && (!loading_started))
	{
		play_sound(snd_UI_start_game,-1,false)
		game_restart()
	}
	
	// check for key press
	if (keyboard_check_pressed(vk_anykey)) key_pressed = true
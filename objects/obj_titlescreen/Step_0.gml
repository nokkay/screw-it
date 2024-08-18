
	// title slides down
	if (!key_pressed)
	{
		title_visible = min(1, title_visible + 0.01)
	}
	else // on key press title is fully visible
	{
		title_visible = max(0,title_visible - 0.01)	

	}

	// start game on any key press
	if (key_pressed && (!loading_started))
	{
		room_transition(TRANS_TYPE.FADE, room_next(room))
		loading_started = true
	}
	
	// check for key press
	if (keyboard_check_pressed(vk_anykey)) key_pressed = true
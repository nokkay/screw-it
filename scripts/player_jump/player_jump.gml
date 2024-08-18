
function player_jump()
{
	// jump key 
	jump_key_pressed = keyboard_check_pressed(vk_space)
	jump_key_hold = keyboard_check(vk_space)
	
	if (jump_key_pressed && (on_ground or on_platform))
	{
		jump_timer = jump_hold_frames	
	}
	
	// end jump early by stopping timer if jump button is not held
	if (!jump_key_hold) jump_timer = 0
	
	// jump based on timer
	if (jump_timer > 0)
	{	
		// constantly set yspd to jump_spd
		yspd = jump_spd
		
		// count down timer
		jump_timer--
	}
}
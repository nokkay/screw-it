
function get_player_sprite()
{

	if (sign(_final_xspd) > 0) image_xscale = 1
	if (sign(_final_xspd) < 0) image_xscale = -1
	 
	// on ground
	if (on_ground)
	{
		if (global.key_right or global.key_left) sprite_index = spr_move
		else sprite_index = spr_idle
	}
	// on platform
	if (on_platform)
	{
		if (global.key_right or global.key_left) sprite_index = spr_move
		else sprite_index = spr_idle
	}
	
	// in air
	if (!on_ground && !on_platform)
	{
		if (_final_yspd < 0) sprite_index = spr_jump
		else sprite_index = spr_fall
	}

}
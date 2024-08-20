
function get_player_sprite()
{

	if (sign(_final_xspd) > 0) image_xscale = 1
	if (sign(_final_xspd) < 0) image_xscale = -1
	 
	// on ground
	if (on_ground or on_platform or on_box)
	{
		last_sprite = sprite_index
		if (global.key_right or global.key_left) sprite_index = spr_move
		else sprite_index = spr_idle
	}
	
	// in air
	if (!on_ground && !on_platform && !on_box)
	{
		last_sprite = sprite_index
		if (_final_yspd < 0) sprite_index = spr_jump
		else sprite_index = spr_fall
	}

}
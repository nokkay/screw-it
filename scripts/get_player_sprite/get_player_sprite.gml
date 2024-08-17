
function get_player_sprite()
{

	if (sign(_final_xspd) > 0) image_xscale = 1
	if (sign(_final_xspd) < 0) image_xscale = -1
	 
	// on ground
	if (on_ground or on_platform)
	{
		if (_final_xspd == 0) sprite_index = spr_idle
		else sprite_index = spr_move
	}
	// in air
	else
	{
		if (_final_yspd < 0) sprite_index = spr_jump
		else sprite_index = spr_fall
	}

}
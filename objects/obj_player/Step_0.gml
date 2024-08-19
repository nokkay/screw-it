/// @desc 

	// draw gun
	// change x offset based on direction facing
	if (image_xscale > 0) gun_x_draw_offset = abs(gun_x_draw_offset)
	else gun_x_draw_offset = - abs(gun_x_draw_offset)
	
	Gun.x = x + gun_x_draw_offset
	Gun.y = y-48

	mask_index = spr_player_hb
	script_execute(state)


	
	
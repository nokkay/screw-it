///@desc 
	
	// player stats
	move_spd = 8
	jump_dist = 24
	
	// speeds
	xspd = 0
	yspd = 0
	
	// gravity
	grav = 20
	grav_accel = 1
	
	// state
	state = player_state_free

	// sprites
	spr_move = spr_player_move
	spr_idle = spr_player_idle
	spr_fall = spr_player_fall
	spr_jump = spr_player_jump
	local_frame = 0
	
	// room transitions
	if (global.target_x != -1)
	{
		x = global.target_x
		y = global.target_y
		image_xscale = global.target_dir
	}


	
	
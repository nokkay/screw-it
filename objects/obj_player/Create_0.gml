///@desc 
	
	// player stats
	move_spd = 8
	
	// jumping variables
	jump_spd = -15
	jump_hold_frames = 12
	jump_timer = 0
	on_ground = false
	on_platform = false
	
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
	
	// room transitions
	if (global.target_x != -1)
	{
		x = global.target_x
		y = global.target_y
		image_xscale = global.target_dir
	}


	
	
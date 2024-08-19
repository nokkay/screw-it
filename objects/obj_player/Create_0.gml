///@desc 
	// player stats
	move_spd = 8
	
	// jumping variables
	jump_spd = -15
	jump_hold_frames = 12
	jump_timer = 0
	on_ground = false
	on_platform = false
	on_box = false
	
	// speeds
	xspd = 0
	yspd = 0
	
	// gravity
	grav = 20
	grav_accel = 1
	
	// state
	state = player_state_free

	// debug
	noclip = false
	
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
	
	//child gun
	if (instance_exists(o_gun)) instance_destroy(o_gun) // make sure we dont have duplicates
	Gun = instance_create_depth(x,y,depth-10,o_gun) // create gun
	
	gun_x_draw_offset = 48
	gun_y_draw_offset = 64
	
	
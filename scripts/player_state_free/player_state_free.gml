
function player_state_free()
{
	
	// inputs
	xdir = global.key_right - global.key_left
	xspd = xdir * move_spd 
	
	// flip sprites
	if (xdir > 0) image_xscale = 1
	if (xdir < 0) image_xscale = -1
	
	// on ground
	if (place_meeting(x,y+3, obj_collision))
	{
		sprite_index = spr_move
		if (xspd = 0) sprite_index = spr_idle
		
		yspd = 0
		if (global.key_jump) yspd = -jump_dist
	}
	// not on ground
	else if (yspd < grav)
	{
		// change sprites when jumping and falling
		sprite_index = spr_jump
		if (sign(yspd) > 0)	sprite_index = spr_fall
		
		yspd += grav_accel // apply gravity acceleration
	}
	
	// move
	move_and_collide(xspd,yspd,obj_collision)
	player_collision()
}
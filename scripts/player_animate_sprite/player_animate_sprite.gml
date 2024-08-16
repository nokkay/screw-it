
function player_animate_sprite()
{
// direction
	if (image_xscale > 0) direction = RIGHT
	if (image_xscale < 0) direction = LEFT
	
// update sprite
	var _cardinal_dir = direction 
	var _total_frames = sprite_get_number(sprite_index) / 4
	image_index = local_frame + (_cardinal_dir * _total_frames)
	local_frame += sprite_get_speed(sprite_index) / FRAME_RATE // animate by changing local_frame
	
// loop animation frames
	if local_frame >= _total_frames
	{
		animation_end = true
		local_frame -= _total_frames // reset to beginning of sprites animation
	}
	else animation_end = false
}
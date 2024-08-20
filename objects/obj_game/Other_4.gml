/// @description Disable layers and spawn player if none
	
	if (global.target_x != -1)
	{
		with (obj_player) instance_destroy() // destroy player if it already exists
		
		if (room != rm_victory) 
		{
			instance_create_layer(global.target_x,global.target_y,"Instances",obj_player) // spawn at target
		}
	}
	
/// @description Disable layers

	layer_set_visible(layer_get_id("Collisions"), false)
	
	if (global.target_x != -1)
	{
		with (obj_player) instance_destroy() // destroy player if it already exists
		instance_create_layer(global.target_x,global.target_y,"Instances",obj_player) // spawn at target
	}
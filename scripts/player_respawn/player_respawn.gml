
function player_respawn()
{
	// destroy player if it exists
	if (instance_exists(obj_player)) instance_destroy(obj_player)

	// check spawnpoint exists
	if (instance_exists(obj_spawnpoint)) 
	{
		// room transition 
		var _transition = instance_create_depth(0,0,-9999,obj_transition) 
		// when screen is completely black, spawn player
		if (!instance_exists(obj_player) && _transition.percent >= 1) instance_create_layer(obj_spawnpoint.x,obj_spawnpoint.y,"Instance",obj_player)
		
	}
	else // no spawnpoint
	{
		show_debug_message("No Spawnpoint in Room!")	
	}
	
}
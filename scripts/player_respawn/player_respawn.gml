
function player_respawn()
{
	// destroy player if it exists
	if (instance_exists(obj_player)) instance_destroy(obj_player)

	// check spawnpoint exists
	if (instance_exists(obj_spawnpoint)) 
	{
		// create room transition only if none exist
		room_transition(TRANS_TYPE.FADE,room)
		// when screen is completely black
		if (!instance_exists(obj_player) && obj_transition.percent >= 1)
		{	// spawn player
			instance_create_layer(obj_spawnpoint.x,obj_spawnpoint.y,"Instance",obj_player)	
		}
	}
	else // no spawnpoint
	{
		show_debug_message("No Spawnpoint in Room!")	
	}
	
}
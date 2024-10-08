
function player_respawn()
{
	// destroy player if it exists
	if (instance_exists(obj_player)) instance_destroy(obj_player)

	// check spawnpoint exists
	if (instance_exists(obj_spawnpoint)) 
	{
		play_sound(snd_UI_back_out,-1,false)
		room_transition(TRANS_TYPE.FADE,room)
	}
	else // no spawnpoint
	{
		show_debug_message("No Spawnpoint in Room!")	
	}
}
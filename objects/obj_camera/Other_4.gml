/// @description Update to players position

	// update viewport 
	if cam != view_camera[0]
	{	
		cam = view_camera[0]
	}
	
	if (instance_exists(follow)) // spawn on player
	{
		x = follow.x 
		y = follow.y
	}

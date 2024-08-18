/// @description Update to players position

	// follow obj_title
	if (room == rm_title && instance_exists(obj_titlescreen))
	{	
		follow = obj_titlescreen
	}
	else follow = obj_player

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

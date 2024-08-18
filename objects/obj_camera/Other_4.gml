/// @description Update to players position

	// update following object
	if (room == rm_title && instance_exists(obj_titlescreen))
	{	
		follow = obj_titlescreen
	}
	if (instance_exists(obj_player)) follow = obj_player
	if (room == rm_intro) follow = obj_intro


	// only have look_above if camera is following player
	if (follow = obj_player)
	{
		look_above = 150	
	}
	else look_above = 0
		

	// update view 
	view_width_half = camera_get_view_width(cam) * 0.5
	view_height_half = camera_get_view_height(cam) * 0.5 + look_above


	// update viewport 
	if cam != view_camera[0]
	{	
		cam = view_camera[0]
	}
	
	if (instance_exists(follow)) // spawn on follow
	{
		x = follow.x 
		y = follow.y
	}

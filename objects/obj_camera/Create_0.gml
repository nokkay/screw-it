 /// @desc Set up camera

	cam = view_camera[0]
	follow = obj_player
	look_above = 0 // 150
	view_width_half = camera_get_view_width(cam) * 0.5
	view_height_half = camera_get_view_height(cam) * 0.5 + look_above

	x_to = xstart
	y_to = ystart
	
	// camera shake settings
	smoothing = 5 
	shake_length = 0
	shake_mag = 0
	shake_remain = 0
	
	
	
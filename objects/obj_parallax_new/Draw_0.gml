
	var _cam_x = camera_get_view_x(view_camera[0])
	var _cam_y = camera_get_view_y(view_camera[0])
	
	// higher the parallax the further away

	draw_sprite_tiled(spr_bg_machine, 2, _cam_x * 1, _cam_y)
	draw_sprite_tiled(spr_bg_machine, 1, _cam_x * .85, _cam_y)
	draw_sprite_tiled(spr_bg_machine, 0, _cam_x * .75, _cam_y)

/// @description 

	if (type == TRANS_TYPE.SLIDE)
	{
		draw_set_color(c_black)
		draw_rectangle(0, 0, width, percent * height_half, false) // top --> down half
		draw_rectangle(0, height, width, height - (percent * height_half), false) // down --> top half
	}
	
	
	if (type == TRANS_TYPE.FADE)
	{
		draw_set_color(c_black)
		draw_set_alpha(percent)
		draw_rectangle(0,0,width,height,false)
		draw_set_alpha(1.0)
	}
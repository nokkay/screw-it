
	if (title_visible > 0)
	{
		draw_sprite(spr_title,0,0, -RESOLUTION_H + title_visible * RESOLUTION_H)	
		
		draw_set_alpha(title_visible * abs(sin(get_timer() * 0.000001 * pi)))
		draw_sprite(spr_title,1,0,0) // press any key
		draw_set_alpha(1.0)
	}

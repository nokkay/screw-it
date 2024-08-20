
	draw_sprite(spr_endscreen,0,0,0)	
		
	draw_set_alpha(abs(sin(get_timer() * 0.000001 * pi)))
	draw_sprite(spr_endscreen,1,0,0) // press any key
	draw_set_alpha(1.0)


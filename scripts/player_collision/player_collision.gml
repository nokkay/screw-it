

function player_collision()
{

	var _collision = false

	// horizontal tiles
	if place_meeting(x+xspd,y,obj_collision)
	{
		xspd = 0
		_collision = true
	}
	
	// vertical tiles
	if place_meeting(x,y+yspd,obj_collision)
	{
		yspd = 0
		_collision = true
	}
	
	return _collision
}


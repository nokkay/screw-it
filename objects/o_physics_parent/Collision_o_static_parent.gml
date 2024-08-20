
if other.PhysicsFlag = true{
	var CollisionDirection = point_direction(x,y,other.x,other.y);
	
	var CollisionCenterDistance = point_distance(x+lengthdir_x(sprite_width,CollisionDirection),
	y+lengthdir_y(sprite_width,CollisionDirection),
	other.x+lengthdir_x(other.sprite_width,CollisionDirection-180),
	other.y+lengthdir_y(other.sprite_width,CollisionDirection-180));
	var CollisionDepth = CollisionCenterDistance-other.sprite_width;

	//show_debug_message("____________ "+string(id));
	//show_debug_message("dist "+string(CollisionCenterDistance));
	//show_debug_message("dir "+string(CollisionDirection));
	if lengthdir_x(CollisionDepth/2,CollisionDirection) = 0 && lengthdir_y(CollisionDepth/2,CollisionDirection) = 0{
		//CollisionDepth += irandom_range(-30,30);//unsticking at random if required
		XVelocity += lengthdir_x(CollisionDepth+(sign(CollisionDepth)*32),CollisionDirection)
		YVelocity += lengthdir_y(CollisionDepth+(sign(CollisionDepth)*32),CollisionDirection)
		//show_debug_message("in "+string(id));
	}
	//show_debug_message(lengthdir_x(CollisionDepth/2,CollisionDirection));
	//show_debug_message(lengthdir_y(CollisionDepth/2,CollisionDirection));
	//show_debug_message("old x "+string(x));
	//show_debug_message("old y "+string(y));
	x -= (lengthdir_x(CollisionDepth/2,CollisionDirection));
	y -= (lengthdir_y(CollisionDepth/2,CollisionDirection));
	//show_debug_message("new x "+string(x));
	//show_debug_message("new y "+string(y));
	other.x -= (lengthdir_x(CollisionDepth/2,CollisionDirection-180));
	other.y -= (lengthdir_y(CollisionDepth/2,CollisionDirection-180));
} else {
	var CollisionDirection = point_direction(x,y,other.x,other.y);
	var CollisionCenterDistance = point_distance(x+lengthdir_x(sprite_width,CollisionDirection),
	y+lengthdir_y(sprite_width,CollisionDirection),
	other.x+lengthdir_x(other.sprite_width,CollisionDirection-180),
	other.y+lengthdir_y(other.sprite_width,CollisionDirection-180));
	var CollisionDepth = CollisionCenterDistance-other.sprite_width;
	if lengthdir_x(CollisionDepth/2,CollisionDirection) = 0 && lengthdir_y(CollisionDepth/2,CollisionDirection) = 0{
		//CollisionDepth += irandom_range(-30,30);//unsticking at random if required
		XVelocity += lengthdir_x(CollisionDepth+(sign(CollisionDepth)*32),CollisionDirection)
		YVelocity += lengthdir_y(CollisionDepth+(sign(CollisionDepth)*32),CollisionDirection)
	}
	var CollisionDepth = CollisionCenterDistance-other.sprite_width;
	if sign(CollisionDepth) > 0{
		x -= lengthdir_x(CollisionDepth/2,CollisionDirection);
		y -= lengthdir_y(CollisionDepth/2,CollisionDirection);
	}
}
//color = c_red;

/*
if other.x > x{
	XVelocity--;	
}
if other.x < x{
	XVelocity++;	
}
if other.y > y{
	YVelocity--;	
}
if other.y < y{
	YVelocity++;	
}
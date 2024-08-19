if GrabbedBool = false{
	if !place_meeting(x,y+sign(Gravity),o_static_parent){
		YVelocity += Gravity;
	}
}
if XVelocity != 0{
	XVelocity = clamp(XVelocity,-32,32);
	if place_meeting(x+XVelocity,y,o_static_parent){
		if !place_meeting(x+sign(XVelocity),y,o_static_parent){
			repeat(ceil(abs(XVelocity))){
				if !place_meeting(x+sign(XVelocity),y,o_static_parent){
					x += sign(XVelocity);
				}
			}
		} else {
			XVelocity = 0;
		}
	} else {//normal
		x += XVelocity;
	}
	XVelocity = XVelocity*Friction;
	if XVelocity <= 1{
		XVelocity = 0;
	}
}
if YVelocity != 0{
	YVelocity = clamp(YVelocity,-32,32);
	if place_meeting(x,y+YVelocity,o_static_parent){
		if !place_meeting(x,y+sign(YVelocity),o_static_parent){
			repeat(ceil(abs(YVelocity))){
				if !place_meeting(x,y+sign(YVelocity),o_static_parent){
					y += sign(YVelocity);
				}
			}
		} else {
			YVelocity = 0;
		}
	} else {//normal
		y += YVelocity;
	}
}
if other.x > x{
	x--;	
}
if other.x <= x{
	x++;	
}
if other.y > y{
	y--;	
}
if other.y <= y{
	x++;	
}
show_debug_message("id:"+string(id)+" x:"+string(x)+" y:"+string(y)+" otherx:"+string(other.x)+" othery:"+string(other.y))
color = c_red;
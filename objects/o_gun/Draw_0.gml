image_angle = direction;
if mouse_check_button(mb_left){
if ObjectGrabbed != noone{
	draw_set_alpha(.4)
	draw_line_width_color(x+lengthdir_x(32,direction),y+lengthdir_y(32,direction),ObjectGrabbed.x,ObjectGrabbed.y,10,c_aqua,c_aqua);
	draw_set_alpha(1)
	} else {
	draw_set_alpha(.4)
	draw_line_width_color(x+lengthdir_x(32,direction),y+lengthdir_y(32,direction),x+lengthdir_x(GunRange*CheckLength,direction),y+lengthdir_y(GunRange*CheckLength,direction),10,c_aqua,c_aqua);
	draw_set_alpha(1)
	}
}
draw_self();
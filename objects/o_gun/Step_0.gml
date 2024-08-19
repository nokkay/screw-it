TargetDirection = point_direction(x,y,mouse_x,mouse_y);
//direction = lerp(direction,TargetDirection,.125);
var DirectionDifference = angle_difference(direction, TargetDirection);
direction -= min(abs(DirectionDifference), 10) * sign(DirectionDifference);

if mouse_check_button_pressed(mb_left){
	CanGrabBool = true;
	RotateOffset = 0;
	audio_group_stop_all(AudioGroup_SFX);
	audio_play_sound(snd_gravity_gun_head,2,false);
	LastspotX = mouse_x;
	LastspotY = mouse_y;
}
if mouse_check_button(mb_left){
	if ObjectGrabbed = noone{
		var i = 0;
		do{
			if place_meeting(x+(i*lengthdir_x(CheckLength,direction)),y+(i*lengthdir_y(CheckLength,direction)),o_physics_parent){
				ObjectGrabbed = instance_place(x+(i*lengthdir_x(CheckLength,direction)),y+(i*lengthdir_y(CheckLength,direction)),o_physics_parent)
				ObjectGrabbed.GrabbedBool = true;
				RotateOffset = ObjectGrabbed.direction
			}
			i++
		} until (ObjectGrabbed != noone || (i >= GunRange));// || (x+i*lengthdir_x(CheckLength,direction) > mouse_x && y+i*lengthdir_y(CheckLength,direction) > mouse_y ))
	} else {
		ObjectGrabbed.x += clamp(lerp(ObjectGrabbed.x,mouse_x,.125)-ObjectGrabbed.x,-16,16);
		ObjectGrabbed.y += clamp(lerp(ObjectGrabbed.y,mouse_y,.125)-ObjectGrabbed.y,-16,16);
		ObjectGrabbed.direction = RotateOffset;
		ObjectGrabbed.image_angle = ObjectGrabbed.direction;
		ObjectGrabbed.XVelocity = 0;
		ObjectGrabbed.YVelocity = 0;
	}
	if !audio_is_playing(snd_gravity_gun_body) && !audio_is_playing(snd_gravity_gun_head){
		audio_play_sound(snd_gravity_gun_body,1,true);
	}
}
if mouse_check_button_released(mb_left){
	CanGrabBool = false;
	if ObjectGrabbed != noone{
		ObjectGrabbed.GrabbedBool = false;
		ObjectGrabbed.XVelocity = 0;
		ObjectGrabbed.YVelocity = 0;
		//ObjectGrabbed.XVelocity = lerp(mouse_x,ObjectGrabbed.x,.125)
		//ObjectGrabbed.YVelocity = lerp(mouse_y,ObjectGrabbed.y,.125)
	}
	ObjectGrabbed = noone;
	audio_stop_sound(snd_gravity_gun_body)
	audio_play_sound(snd_gravity_gun_tail,2,false);
}
/* not working as intended atm - not gamebreaking but also not functional, enable at own peril
if mouse_check_button(mb_right){
	RotateOffset -= RotateSpeed;
}
*/
if mouse_wheel_up(){
	if ObjectGrabbed != noone{
		if ObjectGrabbed.image_xscale > ScaleMin && ObjectGrabbed.image_yscale > ScaleMin{
			ObjectGrabbed.image_xscale -= ScaleSpeed;
			ObjectGrabbed.image_yscale -= ScaleSpeed;
		}
	}
}
if mouse_wheel_down(){
	if ObjectGrabbed != noone{
		if ObjectGrabbed.image_xscale < ScaleMax && ObjectGrabbed.image_yscale < ScaleMax {
			ObjectGrabbed.image_xscale += ScaleSpeed;
			ObjectGrabbed.image_yscale += ScaleSpeed
		}
	}
}
GunRange = 128;//basically multiplied by check length //max distance checked for object collision
CheckLength = 4;//How Percise do we want the check to be | lower = more accurate but more expensive
ObjectGrabbed = noone;
RotateOffset = 0;//what angle should the object selected by offset by
RotateSpeed = 2;//how fast to spin grabbed object clockwise
ScaleSpeed = .25;//how fast to scale
ScaleMin = ScaleSpeed*2;//min scale
ScaleMax = 3;//max scale

LastspotX = mouse_x;//for flicking velocity
LastspotY = mouse_y;//for flicking velocity
	
audio_group_load(AudioGroup_SFX);


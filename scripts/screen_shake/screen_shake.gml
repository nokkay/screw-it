/// @desc screen_shake(_magnitude, _frames)
/// @arg Magnitude sets the strentg of the shake (distance range)
/// @arg Frames set the length of the shake in frames (60 = 1 seconds)

function screen_shake(_magnitude, _frames)
{
	with (global.iCamera)
	{
		if (_magnitude > shake_remain)
		{
			shake_mag = _magnitude
			shake_remain = shake_mag
			shake_length = _frames
		}
	}
}
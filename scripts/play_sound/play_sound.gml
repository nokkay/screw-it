///@desc General script to play sound with some options
///@arg _sound
///@arg _pitch_change amount to randomize pitch, put -1 if none
///@arg _overlap_allowed

function play_sound(_sound, _pitch_change, _overlap_allowed)
{
	// check if sound is playing already 
	var _is_playing = audio_is_playing(_sound)
	
	// if pitch_change enabled and not -1, then change pitch to that amount randomized
	var _pitch_randomize_amount = 0
	if (_pitch_change != -1) _pitch_randomize_amount = _pitch_change
	var _pitch_final = random_range(1 - _pitch_randomize_amount, 1 + _pitch_randomize_amount)
	
	// make sure sound isnt playing if overlap is not allowed
	if (!_overlap_allowed && !_is_playing) 
	{
		audio_play_sound_ext({sound:_sound,_pitch:_pitch_final})
	}
	else if (_overlap_allowed)
	{
		audio_play_sound_ext({sound:_sound,_pitch:_pitch_final})
	}
}

	song_timestamp = current_time - song_start_time; // Calculate elapsed time
   // show_debug_message("Elapsed Time: " + string(song_timestamp));
	
	if (room != rm_title && room != rm_intro && !audio_is_playing(snd_level_song_reduced))
	{

		// Stop the current sound
		audio_stop_sound(current_sound);

		// Start the new sound at the same timestamp
		var new_sound = snd_level_song_reduced; // Replace with your new sound variable or ID

		if (song_timestamp > 0) {
		    // Play the new sound starting at the same position
		    audio_sound_set_track_position(new_sound, song_timestamp * 0.001); // multiply millisec to sec
		}
		audio_play_sound(new_sound, 1, true);
	}
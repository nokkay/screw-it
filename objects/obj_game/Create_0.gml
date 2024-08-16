/// @description Globals, creates other game manager objects

	// randomize seed on start
	randomize()
	
	// game data
	global.game_paused = false
	global.debug_mode = false
	
	// transition data
	global.target_room = -1
	global.target_x = -1
	global.target_y = -1
	global.target_dir = 0

	// game managers
	global.iCamera = instance_create_layer(0,0,layer,obj_camera)
	global.iUI = instance_create_layer(0,0,layer,obj_UI)
	global.iMusic = instance_create_layer(0,0,layer,obj_music)
	global.iInputs = instance_create_layer(0,0,layer,obj_inputs)
	
	// resize screen correct resolution
	surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
	
	// move to starting room defined in macros
	room_goto(ROOM_START)

extends Node

func _process(delta):
	handle_screen_resize()

func handle_screen_resize() -> void:
	if Input.is_action_just_pressed("F11"):
		DisplayServer.window_set_mode(
			DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN 
			if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED
			else DisplayServer.WINDOW_MODE_WINDOWED
		)

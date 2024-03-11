extends Control

func _on_continue_button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	self.hide()

func _on_quit_button_pressed():
	get_tree().quit()

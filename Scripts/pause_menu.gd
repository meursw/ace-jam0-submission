extends Control

func _on_continue_button_pressed():
	unpause()

func _on_quit_button_pressed():
	get_tree().quit()

func unpause() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	self.hide()

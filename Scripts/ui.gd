extends CanvasLayer

@export var pause_menu: Control

func _process(delta) -> void:
	handle_pause_menu()

func handle_pause_menu() -> void:
	if Input.is_action_just_pressed("Pause"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		pause_menu.show()
		get_tree().paused = true


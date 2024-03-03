extends Node3D

@export var dialogue: Dialogue

func _on_area_3d_body_entered(body):
	if body is Player:
		GameEvents.init_dialogue.emit(dialogue)

extends Node3D

@export var dialogue_intro: Dialogue

func _ready():
	GameEvents.init_dialogue.emit(dialogue_intro)

func _on_area_3d_body_entered(body):
	if body is Player:
		get_tree().quit()

extends Node
class_name GameOverComponent

func _ready():
	GameEvents.player_died.connect(func():
		get_tree().change_scene_to_file("res://Resources/DialogueResources/game_over_scene.tscn")
	)

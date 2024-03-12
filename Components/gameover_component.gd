extends Node
class_name GameOverComponent

@export var game_over_scene: PackedScene

func _ready():
	GameEvents.player_died.connect(func():
		get_tree().change_scene_to_packed(game_over_scene)
	)

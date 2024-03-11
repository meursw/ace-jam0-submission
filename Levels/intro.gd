extends Node3D

var forest_level := preload("res://Levels/level_1_forest.tscn")

@export var dialogue: Dialogue

func _ready():
	GameEvents.init_dialogue.emit(dialogue)


func _on_teleport_to_forest_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_packed(forest_level)

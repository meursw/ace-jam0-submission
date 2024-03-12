class_name TeleportComponent
extends Area3D

@export var next_level: PackedScene

func _on_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_packed(next_level)

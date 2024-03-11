class_name ShakeComponent
extends Node

@export var node: Node
@export var shake_amount: = 2.0
@export var shake_duration: = 0.4

var shake = 0

# This is the function that activates this component
func tween_shake():
	shake = shake_amount
	var tween = create_tween()
	tween.tween_property(self, "shake", 0.0, shake_duration).from_current()

func _physics_process(delta: float) -> void:
	# Manipulate the position of the node by the shake amount every physics frame
	# Use randf_range to pick a random x and y value using the shake value
	if node is Node3D:
		node.position = Vector3(randf_range(-shake, shake), randf_range(-shake, shake), randf_range(-shake, shake))
	else:
		node.position = Vector2(randf_range(-shake, shake), randf_range(-shake, shake))

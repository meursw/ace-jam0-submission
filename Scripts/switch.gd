class_name Switch
extends Area3D

signal activate

func _on_body_entered(body):
	if body is RigidBody3D and body.freeze == false:
		activate.emit()

class_name BaseWeapon
extends Node3D

@export var weapon_resource: Weapon

func _ready():
	set_up_weapon()

func set_up_weapon() -> void:
	self.position = weapon_resource.position
	self.rotation_degrees = weapon_resource.rotation
	
	

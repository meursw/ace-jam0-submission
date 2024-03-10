class_name HealthComponent
extends Node

@export var health := 1:
	set(value):
		health = value
		print(health)
		if health <= 0: died.emit()

signal died

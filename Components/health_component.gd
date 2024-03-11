class_name HealthComponent
extends Node

@export var health := 1:
	set(value):
		health = value
		lost_health.emit()
		if health <= 0: died.emit()

signal died
signal lost_health

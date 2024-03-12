extends Node3D

@onready var holy_book = %holy_book
@onready var ghost_trap = %ghost_trap
@onready var wooden_stake_rotate = %WoodenStakeRotate

func _process(delta):
	holy_book.rotate_y(delta)
	ghost_trap.rotate_y(delta)
	wooden_stake_rotate.rotate_y(delta)
	

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/intro.tscn")

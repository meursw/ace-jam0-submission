extends Node3D

@export var dialogue: Dialogue

func _ready():
	GameEvents.init_dialogue.emit(dialogue)

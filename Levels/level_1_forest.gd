extends Node3D

@export var dialogue_intro: Dialogue
@export var dialogue_end: Dialogue
@onready var enemies = %Enemies

var dialogue_initiated := false

func _ready():
	GameEvents.init_dialogue.emit(dialogue_intro)

func _process(delta):
	if enemies.get_children().size() == 0 and not dialogue_initiated:
		GameEvents.init_dialogue.emit(dialogue_end)
		dialogue_initiated = true


func _on_area_3d_body_entered(body):
	if body is Player:
		body.global_position = Vector3(49,20,86)

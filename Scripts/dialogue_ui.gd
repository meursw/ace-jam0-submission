extends Control

# Resources
@export var run_time_data: RunTimeData
var curr_dialogue: Dialogue

@export var dialogue_label: Label
@onready var avatar = %Avatar

var curr_slide_index := 0

func _ready():
	GameEvents.init_dialogue.connect(func(dialogue: Dialogue):
		run_time_data.curr_gameplay_state = Enums.GameState.IN_DIALOG
		curr_dialogue = dialogue
		start_dialogue()
	)
	
func _input(event):
	if curr_dialogue and (Input.is_action_just_pressed("LClick") or Input.is_action_just_pressed("Enter")):
		if curr_slide_index < curr_dialogue.dialogue.size() - 1:
			curr_slide_index += 1
			show_slide()
		else:
			end_dialogue()

func start_dialogue() -> void:
	self.show()
	curr_slide_index = 0
	avatar.texture = curr_dialogue.avatar
	show_slide()

func show_slide() -> void:
	dialogue_label.text = curr_dialogue.dialogue[curr_slide_index]

func end_dialogue() -> void:
	run_time_data.curr_gameplay_state = Enums.GameState.FREE
	self.hide()
	
	

extends Control

# Resources
@export var run_time_data: RunTimeData
var curr_dialogue: Dialogue

@export var dialogue_label: Label

var curr_slide_index := 0
var curr_letter_index := 0
var slide_ended

func _ready():
	GameEvents.init_dialogue.connect(func(dialogue: Dialogue):
		run_time_data.curr_gameplay_state = Enums.GameState.IN_DIALOG
		curr_dialogue = dialogue
		start_dialogue()
	)
	
func _input(event):
	if curr_dialogue and Input.is_action_just_pressed("LClick") and slide_ended:
		if curr_slide_index < curr_dialogue.dialogue.size() - 1:
			curr_slide_index += 1
			show_slide()
		else:
			end_dialogue()
	
	if Input.is_action_just_pressed("Enter"):
		end_dialogue()

func start_dialogue() -> void:
	self.show()
	curr_slide_index = 0
	show_slide()

func show_slide() -> void:
	slide_ended = false
	dialogue_label.text = ""
	curr_letter_index = 0
	show_letter()

func show_letter() -> void:
	dialogue_label.text += curr_dialogue.dialogue[curr_slide_index][curr_letter_index]
	curr_letter_index += 1
	
	if curr_letter_index >= curr_dialogue.dialogue[curr_slide_index].length():
		slide_ended = true
		return
	
	var wait_time:float
	
	match curr_dialogue.dialogue[curr_slide_index][curr_letter_index]:
		".", ",":
			wait_time = 0.15
		_:
			wait_time = 0.08
		
	await get_tree().create_timer(wait_time).timeout
	show_letter()
	
func end_dialogue() -> void:
	run_time_data.curr_gameplay_state = Enums.GameState.FREE
	self.hide()
	
	

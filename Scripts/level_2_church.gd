extends BasicLevelFunctionality

@export var holy_book: Pickup
@export var spotlight: SpotLight3D
@export var spotlight2: SpotLight3D
@export var cover: MeshInstance3D

@onready var directional_light_3d := %DirectionalLight3D
@onready var cover_collision := %CollisionShape3D
@onready var lights := %Lights
@onready var pickup := %Pickup
var holy_book_picked_up := false

var player

func _ready():
	player = get_tree().get_first_node_in_group("player")
	super()

func _process(delta):
	if not holy_book:
		holy_book_picked_up = true
	
	if holy_book_picked_up:
		enemies.process_mode = Node.PROCESS_MODE_INHERIT
		enemies.show()
		super(delta)
	
	if dialogue_initiated:
		reveal_hole()

func reveal_hole() -> void:
	lights.hide()
	spotlight.show()
	spotlight2.show()
	directional_light_3d.hide()
		
	cover.hide()
	cover_collision.disabled = true

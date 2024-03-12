extends BasicLevelFunctionality

@export var cover: MeshInstance3D
@export var spotlight: SpotLight3D
@onready var directional_light_3d = %DirectionalLight3D
@onready var cover_collision = %CollisionShape3D

func _ready():
	super()

func _process(delta):
	super(delta)
	if dialogue_initiated:
		spotlight.show()
		directional_light_3d.hide()
		
		cover.hide()
		cover_collision.disabled = true

func _on_area_3d_body_entered(body):
	if body is Player:
		body.global_position = Vector3(49,20,86)

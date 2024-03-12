extends BaseWeapon

@export var hitbox_component: HitboxComponent
@export var flashlight: OmniLight3D
@export var marker3d: Marker3D
@export var particles: GPUParticles3D
@export var timer: Timer


func _ready():
	super()
	hitbox_component.area_entered.connect(func(area: Area3D):
		area.hurt.emit(hitbox_component)
	)

func _process(delta):
	if Input.is_action_pressed("LClick"):
		particles.emitting = true
		hitbox_component.process_mode = Node.PROCESS_MODE_INHERIT
		flashlight.show()
	else:
		particles.emitting = false
		flashlight.hide()
		hitbox_component.process_mode = Node.PROCESS_MODE_DISABLED

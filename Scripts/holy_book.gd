extends BaseWeapon

@export var hitbox_comp: HitboxComponent
@export var animation_player: AnimationPlayer
@export var particles : GPUParticles3D
@export var particles_rt : RemoteTransform3D
var is_open := false

var player: Player

func _ready():
	super()
	player = get_tree().get_first_node_in_group("player")
	particles.rotation_degrees = Vector3(0.0,0.0,0.0)

func _process(delta):
	if Input.is_action_pressed("LClick"):
		player.set_physics_process(false)
		particles.global_position = player.global_position
		hitbox_comp.process_mode = Node.PROCESS_MODE_INHERIT
		if not is_open:
			particles.restart()
			is_open = true
			animation_player.play("open")
	else:
		player.set_physics_process(true)
		hitbox_comp.process_mode = Node.PROCESS_MODE_DISABLED
		if is_open:
			particles.emitting = false
			is_open = false
			animation_player.play("close")
		

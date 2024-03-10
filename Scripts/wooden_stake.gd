extends BaseWeapon

@export var timer: Timer
var hit_ray: RayCast3D

func _ready():
	super()
	hit_ray = get_tree().get_first_node_in_group("player").find_child("Raycast")

func _process(delta):
	hit_ray.force_raycast_update()
	var collider = hit_ray.get_collider() as HurtboxComponent
	if Input.is_action_just_pressed("LClick") and timer.is_stopped():
		timer.start()
		if collider and collider.get_parent() is Bug:
			collider.hurt.emit(HitboxComponent.new())


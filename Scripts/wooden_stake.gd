extends BaseWeapon

@export var timer: Timer
var hit_ray: RayCast3D

func _ready():
	super()
	hit_ray = get_tree().get_first_node_in_group("player").find_child("Raycast")

func _process(delta):
	hit_ray.force_raycast_update()
	if Input.is_action_just_pressed("LClick") and timer.is_stopped():
		timer.start()
		lunge_stake()

func lunge_stake() -> void:
	var original_z: float = self.position.z
	
	# animate stake (putting this in a function breaks things)
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BOUNCE)
	
	tween.tween_property(self,"position:z",0.4,0.2)
	tween.tween_property(self,"position:z",-0.8,0.1)
	await get_tree().create_timer(0.2 + 0.1).timeout
	
	check_for_bug_to_damage()
	
	# bring stake back to original position, need a second tween because of await .. .timeout
	var tween2 = create_tween()
	tween2.tween_property(self,"position:z",original_z,0.2)


func check_for_bug_to_damage() -> void:
	var collider = hit_ray.get_collider() as HurtboxComponent
	if collider and collider.get_parent() is Bug:
		collider.hurt.emit(HitboxComponent.new())

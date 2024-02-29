extends Camera3D

@export var pick_ray: RayCast3D
@export var object_position: Marker3D

var picked_object: RigidBody3D = null

func _input(event):
	if Input.is_action_just_pressed("PickUp"):
		if not picked_object and check_for_object():
			picked_object.freeze = true
			picked_object.global_position = object_position.global_position
		elif picked_object:
			throw_object()
			

func _process(delta):
	if picked_object:
		var tween = create_tween()
		tween.tween_property(picked_object,"global_position",object_position.global_position,0.2)

func check_for_object() -> bool:	
	pick_ray.force_raycast_update()
	var collider = pick_ray.get_collider()
	
	if collider is RigidBody3D:
		picked_object = collider
		return true
	
	return false


func throw_object() -> void:
	picked_object.freeze = false
	var throw = picked_object.global_position - self.global_position
	picked_object.apply_central_impulse(throw * 2.0)
	picked_object = null

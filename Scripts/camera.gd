extends Camera3D

@export var pick_ray: RayCast3D

var is_mousing_over := true

func _process(delta):
	pick_ray.force_raycast_update()
	var collider = pick_ray.get_collider()
	if collider is Pickup:
		if !is_mousing_over:
			is_mousing_over = true
			GameEvents.pickup_moused_over.emit(collider)
		if Input.is_action_just_pressed("Interact"):
			get_parent().pick_up_item(collider.item)
			collider.queue_free()
	elif is_mousing_over:
		is_mousing_over = false
		GameEvents.pickup_moused_out.emit()
		

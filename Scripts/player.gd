extends CharacterBody3D

@export_category("Player")
@export_subgroup("Player Nodes")
@export var _camera_3d: Camera3D
@export_subgroup("Player Variables")
@export var _speed := 5.0
@export var _gravity := 9.8
@export var _mouse_sens := 0.1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	#_apply_gravity(delta)
	_movement()

func _input(event):
	camera_control(event)
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()

func _movement() -> void:
	var input_dir = Input.get_vector("Left","Right","Forwards","Backwards")
	var direction = transform.basis*Vector3(input_dir.x,0,input_dir.y).normalized()
	
	if direction:
		velocity.x = _speed * direction.x 
		velocity.z = _speed * direction.z
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	move_and_slide()

func _apply_gravity(delta) -> void:
	if not is_on_floor():
		if velocity.y >= 0:
			velocity.y -= _gravity * delta
		else:
			velocity.y -= _gravity * delta 

func camera_control(event: InputEvent) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion: 
		self.rotation_degrees.y -= mouse_motion.relative.x * _mouse_sens
		
		var camera_tilt = _camera_3d.rotation_degrees.x
		camera_tilt -= mouse_motion.relative.y * _mouse_sens
		_camera_3d.rotation_degrees.x = clampf(camera_tilt,-90,90)

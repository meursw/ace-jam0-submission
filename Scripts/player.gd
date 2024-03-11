class_name Player
extends CharacterBody3D

@export_category("Player")
@export_subgroup("Player Nodes")
@export var _camera_3d: Camera3D
@export var weapon_handler: Node3D
@export var damage_texture_regular: TextureRect
@export var damage_texture_vomit: TextureRect
@export var health_component: HealthComponent
@export var shake_component: ShakeComponent
@export var health_bar: Sprite2D
@export_subgroup("Player Resources")
@export var run_time_data: RunTimeData
@export_subgroup("Player Variables")
@export var _speed := 5.0
@export var _gravity := 9.8
@export var _mouse_sens := 0.1


var inventory: Inventory = Inventory.new()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	health_component.lost_health.connect(func():
		if health_bar.frame < 4:
			health_bar.frame += 1
		shake_component.tween_shake()
	)
	

func _physics_process(delta):
	_apply_gravity(delta)
	if run_time_data.curr_gameplay_state == Enums.GameState.FREE:
		#_handle_jump()
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

func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		if velocity.y >= 0:
			velocity.y -= _gravity * delta
		else:
			velocity.y -= _gravity * delta 

func _handle_jump() -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = 5.0

func camera_control(event: InputEvent) -> void:
	var mouse_motion = event as InputEventMouseMotion
	if mouse_motion and run_time_data.curr_gameplay_state == Enums.GameState.FREE: 
		self.rotation_degrees.y -= mouse_motion.relative.x * _mouse_sens
		
		var camera_tilt = _camera_3d.rotation_degrees.x
		camera_tilt -= mouse_motion.relative.y * _mouse_sens
		_camera_3d.rotation_degrees.x = clampf(camera_tilt,-90,90)

func pick_up_item(item:Item):
	inventory.add_item(item)
	if item is Weapon:
		weapon_handler.add_weapon(item)
	GameEvents.item_picked_up.emit(item)


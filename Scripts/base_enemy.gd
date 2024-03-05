class_name Enemy
extends CharacterBody3D

@export var nav_agent: NavigationAgent3D

@export_category("Enemy Params")
@export var _speed := 2.0
@export var _aggro_range := 10.0
@export var _attack_range := 1.0

var player
var provoked := false
var can_attack := false

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _process(delta):
	if provoked:
		nav_agent.target_position = player.global_position

func _physics_process(delta: float) -> void:
	var next_position = nav_agent.get_next_path_position()
	
	var direction = global_position.direction_to(next_position)
	var distance = global_position.distance_to(player.global_position)
	
	if distance <= _aggro_range:
		provoked = true
	
	if provoked:
		if distance <= _attack_range:
			#attack
			pass
	
	if direction:
		look_at_target(direction)
		velocity.x = direction.x * _speed
		velocity.z = direction.z * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)
		velocity.z = move_toward(velocity.z, 0, _speed)

	move_and_slide()

func look_at_target(direction: Vector3) -> void:
	var adjusted_direction = direction
	adjusted_direction.y = 0
	look_at(global_position + adjusted_direction,Vector3.UP,true)
	

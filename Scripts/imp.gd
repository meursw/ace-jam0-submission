class_name Imp
extends CharacterBody3D

@export var nav_agent: NavigationAgent3D
@export var animation_player: AnimationPlayer
@export var animation_tree: AnimationTree
@export var vomit_particles: GPUParticles3D
@onready var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

@export_category("Enemy Params")
@export var _speed := 2.0
@export var _aggro_range := 10.0
@export var _attack_range := 1.5
@export_category("Enemy Components")
@export var hurtbox_component: HurtboxComponent
@export var hitbox_component: HitboxComponent
@export var shake_component: ShakeComponent

var player
var provoked := false
var can_attack := false
var distance

func _ready():
	player = get_tree().get_first_node_in_group("player")
	GameEvents.player_died.connect(func():
		player = null
	)
	
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		shake_component.tween_shake()
	)
	
func _process(delta):
	if provoked and player:
		nav_agent.target_position = player.global_position

func _physics_process(delta: float) -> void:
	if player: #check if there is a player to chase
		var next_position = nav_agent.get_next_path_position()
		
		var direction = global_position.direction_to(next_position)
		distance = global_position.distance_to(player.global_position)
		
		if distance <= _aggro_range:
			provoked = true
		
		if distance <= _attack_range:
			playback.travel("attack")
		else:
			hitbox_component.monitoring = false
		
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

func spawn_goo() -> void:
	vomit_particles.restart()

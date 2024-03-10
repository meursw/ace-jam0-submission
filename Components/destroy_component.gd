class_name DestroyComponent
extends Node

@export var actor: Node3D
@export var health_comp: HealthComponent


func _ready():
	health_comp.died.connect(func():
		if actor is Player:
			GameEvents.player_died.emit() # enemy.gd listens to this
		if actor is Enemy:
			actor.animation_player.play("shrink_death")
			await get_tree().create_timer(0.3).timeout # 0.3 == how long the animation is. (bad way to do it)
		actor.queue_free.call_deferred()
	)
	

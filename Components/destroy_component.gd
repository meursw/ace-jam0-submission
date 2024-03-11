class_name DestroyComponent
extends Node

@export var actor: Node3D
@export var health_comp: HealthComponent


func _ready():
	health_comp.died.connect(func():
		if actor is Player:
			GameEvents.player_died.emit() # enemy.gd listens to this
		# I broke inheritance along development... oops!
		if actor is Bug or actor is Imp:
			var tween = create_tween()
			tween.tween_property(actor,"scale",Vector3(0.01,0.01,0.01),0.3)
			await get_tree().create_timer(0.3).timeout # 0.3 == how long the animation is. (bad way to do it)
		actor.queue_free()
	)
	

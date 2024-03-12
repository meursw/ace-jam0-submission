extends Node

@export var actor: Node3D
@export var hurtbox_component: HurtboxComponent


func _ready():
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		var ghost_trap = hitbox.get_parent()
		var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
		
		tween.set_parallel().tween_property(actor,"global_position",ghost_trap.marker3d.global_position,0.5)
		tween.set_parallel().tween_property(actor,"scale",Vector3(0.01,0.01,0.01),0.5)
		await get_tree().create_timer(0.5).timeout
		
		actor.queue_free()
	)

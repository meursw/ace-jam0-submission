class_name HurtComponent
extends Node

@export var health_comp: HealthComponent
@export var hurtbox_comp: HurtboxComponent

func _ready():
	hurtbox_comp.hurt.connect(func(hitbox: HitboxComponent): 
		health_comp.health -= hitbox.damage
	)
		

class_name HurtComponent
extends Node

@export var health_comp: HealthComponent
@export var hurtbox_comp: HurtboxComponent

func _ready():
	hurtbox_comp.hurt.connect(func(hitbox: HitboxComponent): 
		health_comp.health -= hitbox.damage
		if get_parent() is Player:
			var damage_texture: TextureRect
			print(hitbox.get_parent())
			if hitbox.get_parent() is Imp:
				damage_texture = get_parent().damage_texture_vomit
			else:
				damage_texture = get_parent().damage_texture_regular
			display_damage_texture(damage_texture)
	)

func display_damage_texture(damage_texture: TextureRect) -> void:
	damage_texture.scale = Vector2(1.0,1.0)
	damage_texture.modulate.a = 1.0
	damage_texture.show()
			
	var tween = create_tween()
	tween.parallel().tween_property(damage_texture,"scale",Vector2(1.5,1.5),1.0)
	tween.parallel().tween_property(damage_texture,"modulate:a",0.0,1.0)
			
	await get_tree().create_timer(1.0).timeout
	damage_texture.hide()
	

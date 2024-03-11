class_name HurtComponent
extends Node

@export var health_comp: HealthComponent
@export var hurtbox_comp: HurtboxComponent

func _ready():
	hurtbox_comp.hurt.connect(func(hitbox: HitboxComponent): 
		health_comp.health -= hitbox.damage
		
		if get_parent() is Player:
			var damage_texture: TextureRect
			if hitbox.get_parent() is Imp:
				damage_texture = get_parent().damage_texture_vomit
			else:
				damage_texture = get_parent().damage_texture_regular
			display_damage_texture(damage_texture,hitbox)
	
	)


func display_damage_texture(damage_texture: TextureRect,hitbox: HitboxComponent) -> void:
	damage_texture.scale = Vector2(1.0,1.0)
	damage_texture.modulate.a = 1.0
	damage_texture.show()
	
	var hitbox_attack_speed := hitbox.attack_speed
	
	var tween = create_tween()
	tween.parallel().tween_property(damage_texture,"scale",Vector2(1.5,1.5), hitbox_attack_speed)
	tween.parallel().tween_property(damage_texture,"modulate:a",0.0, hitbox_attack_speed)
			
	await get_tree().create_timer(hitbox_attack_speed).timeout
	damage_texture.hide()
	

class_name HitboxComponent
extends Area3D

@export var damage := 1
@export var attack_speed := 1.0
@export var timer: Timer

func _ready():
	area_entered.connect(_on_area_entered)
	timer.timeout.connect(func():
		set_deferred("monitoring", true)
	)

func _on_area_entered(hurtbox: HurtboxComponent) -> void:
	if not hurtbox is HurtboxComponent or not timer.is_stopped(): 
		return
	
	hurtbox.hurt.emit(self)
	# turn off area3d and turn back on so that if the player is still inside they keep getting hurt
	# may not be the best method.
	set_deferred("monitoring", false)
	timer.start(attack_speed)

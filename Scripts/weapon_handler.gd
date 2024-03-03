class_name WeaponHandler
extends Node

# I THINK THIS APPROACH IS REALLY BAD I THINK,, BUT WHAT CAN YOU DO. 
@export var weapon_array: Array[PackedScene]

func _unhandled_input(event):
	if Input.is_action_just_pressed("Equip1"):
		equip_weapon(Enums.WeaponType.WOODENSTAKE)
	if Input.is_action_just_pressed("Equip2"):
		equip_weapon(Enums.WeaponType.HOLYBOOK)
	if Input.is_action_just_pressed("Equip3"):
		equip_weapon(Enums.WeaponType.GHOSTTRAP)

func add_weapon(weapon: Weapon):
	add_child(weapon_array[weapon.weapon_type].instantiate())
	equip_weapon(weapon.weapon_type)
	
func equip_weapon(weapon_type: Enums.WeaponType) -> void:
	for child in self.get_children():
		if child.weapon_resource.weapon_type == weapon_type:
			child.visible = true
			child.set_process(true)
		else:
			child.visible = false
			child.set_process(false)

class_name ItemGrid
extends GridContainer

@export var item_slot_scene: PackedScene
@export var wooden_stake: Control
@export var holy_book: Control
@export var ghost_trap: Control

func add_slot_scene(item: Item) -> void:
	var instance = item_slot_scene.instantiate()
	match item.weapon_type:
			Enums.WeaponType.WOODENSTAKE:
				wooden_stake.add_child(instance)
			Enums.WeaponType.HOLYBOOK:
				holy_book.add_child(instance)
			Enums.WeaponType.GHOSTTRAP:
				ghost_trap.add_child(instance)
	instance.display(item)

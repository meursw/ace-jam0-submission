class_name ItemGrid
extends GridContainer

@export var item_slot_scene: PackedScene
@export var wooden_stake: Control
@export var holy_book: Control
@export var ghost_trap: Control

func _ready():
	GameEvents.weapon_equiped.connect(highlight_weapon)

func add_slot_scene(item: Item) -> void:
	var instance = item_slot_scene.instantiate()
	#for loop is better
	match item.weapon_type:
			Enums.WeaponType.WOODENSTAKE:
				wooden_stake.add_child(instance)
			Enums.WeaponType.HOLYBOOK:
				holy_book.add_child(instance)
			Enums.WeaponType.GHOSTTRAP:
				ghost_trap.add_child(instance)
	instance.display(item)
	
func highlight_weapon(remove_highlight: Enums.WeaponType, add_highlight: Enums.WeaponType) -> void:
	#for loop is better
	match remove_highlight:
		Enums.WeaponType.WOODENSTAKE:
				wooden_stake.get_child(0).hide()
		Enums.WeaponType.HOLYBOOK:
				holy_book.get_child(0).hide()
		Enums.WeaponType.GHOSTTRAP:
				ghost_trap.get_child(0).hide()
	
	match add_highlight:
		Enums.WeaponType.WOODENSTAKE:
				wooden_stake.get_child(0).show()
		Enums.WeaponType.HOLYBOOK:
				holy_book.get_child(0).show()
		Enums.WeaponType.GHOSTTRAP:
				ghost_trap.get_child(0).show()
	

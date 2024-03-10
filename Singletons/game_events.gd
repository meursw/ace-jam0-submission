extends Node

signal init_dialogue(dialogue: Dialogue)
signal item_picked_up(item: Item)

signal pickup_moused_over(pickup: Pickup)
signal pickup_moused_out(pickup: Pickup)

signal player_died

signal weapon_equiped(prev: Enums.WeaponType, curr: Enums.WeaponType)

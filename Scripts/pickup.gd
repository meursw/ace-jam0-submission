class_name Pickup
extends Area3D

@export var item: Item
@export var label: Label


func _ready():
	GameEvents.pickup_moused_over.connect(func(hovered_pickup: Pickup):
		if hovered_pickup == self:
			label.show()
			label.text = "Press [E] to pick up " + str(item.name) + "."
	)
	GameEvents.pickup_moused_out.connect(func():
		label.hide()
	)
	
	var instance = item.scene.instantiate()
	add_child(instance)

func show_label() -> void:
	label.show()
	label.text = "Press [E] to pick up " + str(item.name) + "."
	

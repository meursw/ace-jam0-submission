extends PanelContainer

@export var item_grid: ItemGrid

func _ready():
	GameEvents.item_picked_up.connect(func(item: Item):
		item_grid.add_slot_scene(item)
	)

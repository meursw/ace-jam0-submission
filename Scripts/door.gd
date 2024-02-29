extends CSGBox3D

@export var switch: Switch
@export var door_frame: CSGBox3D

func _ready():
	switch.activate.connect(func():
		var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		tween.tween_property(door_frame,"size:y",self.size.y,1.0)
	)
	

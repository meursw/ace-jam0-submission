extends CSGBox3D

@export var switch: Switch
@export var door_frame: CSGBox3D

var open := false

func _ready():
	switch.activate.connect(func():
		var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
		if not open:
			open = true
			tween.tween_property(door_frame,"size:y",self.size.y,1.0)
		elif open:
			open = false
			tween.tween_property(door_frame,"size:y",0.0,1.0)
	)
	

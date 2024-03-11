extends Node3D

func _process(delta):
	self.rotate_y(delta * 0.5)
	scroll_logo(delta * 0.05)
	
func scroll_logo(pan_speed) -> void:
	self.position.x += pan_speed
	#if out of bounds
	if self.position.x >= 0.3:
		self.position.x = -0.3

extends ColorRect

func _process(delta):
	var tween = create_tween()
	tween.parallel().tween_property(self,"modulate:a",0.0,0.5)
	
	await get_tree().create_timer(1.0).timeout
	self.queue_free()

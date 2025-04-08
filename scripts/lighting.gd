extends DirectionalLight2D

func _physics_process(delta: float) -> void:
	energy += delta * randf() * randi_range(-1, 1) 
		
		

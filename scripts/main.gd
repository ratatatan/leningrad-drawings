extends Control

func _input(event: InputEvent) -> void:
	if event.is_action("esc"):
		get_tree().quit()

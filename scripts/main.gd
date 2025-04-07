extends Control

#func _input(event: InputEvent) -> void:
	#if event.is_action("esc"):
		#get_tree().quit()


func _pressed() -> void:
	pass # Replace with function body.


func _on_close_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

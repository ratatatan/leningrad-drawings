extends Control

func _on_close_pressed() -> void:
	get_tree().change_scene_to_packed(Constants.menu_scene)

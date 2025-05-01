extends Control

@onready var volume_slider: HSlider = $VolumeSlider


func _ready() -> void:
	volume_slider.value = Settings.volume
	

func _on_close_pressed() -> void:
	get_tree().change_scene_to_packed(Constants.get_menu_scene())


func _on_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Settings.volume = volume_slider.value

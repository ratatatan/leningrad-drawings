extends Control

#@onready var volume_slider: HSlider = $Volume/VolumeSlider
#@onready var display: RichTextLabel = $Volume/Display
#@onready var check_button: CheckButton = $Animation/CheckButton
#
#
#func _ready() -> void:
	#volume_slider.value = Settings.volume
	#_on_volume_slider_drag_ended(true)
	#check_button.button_pressed = Settings.animations


func _on_close_pressed() -> void:
	get_tree().change_scene_to_packed(Constants.get_menu_scene())
#
#
#func _on_volume_slider_drag_ended(value_changed: bool) -> void:
	#if value_changed:
		#Settings.volume = volume_slider.value
		#display.text = "Звук: {volume}%".format({"volume": volume_slider.value})
#
#
#func _on_check_button_toggled(toggled_on: bool) -> void:
	#Settings.animations = toggled_on
		#

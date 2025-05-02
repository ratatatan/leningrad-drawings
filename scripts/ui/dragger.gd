class_name Dragger extends Control

@export var text: String = "Звук"
@export var setting: StringName = &"volume"

@onready var display_text: RichTextLabel = $DisplayText
@onready var slider: HSlider = $Slider

func _ready() -> void:
	slider.value = Settings.get(setting)
	slider.drag_ended.connect(_on_slider_dragged)
	_on_slider_dragged(true)
	
func _on_slider_dragged(value_changed: bool) -> void:
	if value_changed:
		Settings.set(setting, slider.value)
		display_text.text = "%s: %d%%" % [text, slider.value]

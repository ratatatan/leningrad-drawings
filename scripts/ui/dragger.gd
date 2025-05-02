class_name Dragger extends Control

@export var display_text: String = "Parameter"
@export var setting: StringName = &"parameter"

@onready var label: RichTextLabel = $Label
@onready var slider: HSlider = $Slider

func _ready() -> void:
	slider.value = Settings.get(setting)
	slider.drag_ended.connect(_on_slider_dragged)
	_on_slider_dragged(true)
	
func _on_slider_dragged(value_changed: bool) -> void:
	if value_changed:
		Settings.set(setting, slider.value)
		label.text = "%s: %d%%" % [display_text, slider.value]

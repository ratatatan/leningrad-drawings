class_name Toggle extends CheckButton

@export var display_text: String = "Parameter"
@export var setting: StringName = &"parameter"

func _ready() -> void:
	text = "%s:" % display_text
	button_pressed = Settings.get(setting)
	toggled.connect(_on_toggled)

func _on_toggled(toggle_on: bool) -> void:
	Settings.set(setting, toggle_on)

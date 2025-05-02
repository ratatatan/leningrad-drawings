class_name Toggle extends CheckButton

@export var setting: StringName = &"animations"

func _ready() -> void:
	button_pressed = Settings.get(setting)
	toggled.connect(_on_toggled)

func _on_toggled(toggle_on: bool) -> void:
	Settings.set(setting, toggle_on)

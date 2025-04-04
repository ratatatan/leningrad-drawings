extends TextureButton

@export var panel: Control

func _pressed() -> void:
	panel.visible = true

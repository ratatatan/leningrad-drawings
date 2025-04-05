class_name Readable extends TextureButton

@export var panel: ReadableContents

func _pressed() -> void:
	panel.open()

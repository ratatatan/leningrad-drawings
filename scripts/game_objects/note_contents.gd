extends ReadableContents


func open():
	visible = true


func close():
	visible = false

func _on_close_pressed() -> void:
	close()

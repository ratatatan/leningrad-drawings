extends RichTextLabel

func _ready() -> void:
	var size := get_viewport_rect().size
	if size.x == 1920 and size.y == 1080:
		add_theme_font_size_override("normal_font_size", 28)
	elif size.x == 1920*2 and size.y == 1080*2:
		add_theme_font_size_override("normal_font_size", 55)

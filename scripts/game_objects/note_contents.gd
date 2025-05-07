extends ReadableContents

var tween: Tween

func _init() -> void:
	if Settings.animations_enabled:
		modulate = Color.TRANSPARENT
	

func open() -> void:
	visible = true
	if Settings.animations_enabled:
		tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
		tween.tween_property(self, "modulate", Color.WHITE, 0.5)

func close() -> void:
	if Settings.animations_enabled:
		tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
		tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.5)
		await tween.finished
	visible = false

func _on_close_pressed() -> void:
	close()

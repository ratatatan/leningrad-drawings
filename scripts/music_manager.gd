extends AudioStreamPlayer

func _init() -> void:
	autoplay = true
	stream = preload("res://assets/audio/other/back-music.ogg")
	stream.loop = true
	bus = "Music"

extends AudioStreamPlayer

func _ready() -> void:
	stream = preload("res://assets/audio/other/back-music.ogg")
	#stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
	#print(stream.get_length())
	stream.loop = true
	volume_db = linear_to_db(Settings.music_volume / 100.0)
	play()
	Settings.settings_changed.connect(_on_settings_changed)

func _on_settings_changed(setting: StringName, value: Variant) -> void:
	if setting == &"music_volume":
		volume_db = linear_to_db(value / 100.0)

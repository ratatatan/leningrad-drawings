extends Node

var menu_intro_enabled := true
var animations_enabled := true
var subtitles_enabled := false

var master_volume : float:
	set(x):
		var bus := AudioServer.get_bus_index("Master")
		AudioServer.set_bus_volume_linear(bus, x / 100.0)
		master_volume = x

var speech_volume : float:
	set(x):
		var bus := AudioServer.get_bus_index("Speech")
		AudioServer.set_bus_volume_linear(bus, x / 100.0)
		speech_volume = x

var sfx_volume : float:
	set(x):
		var bus := AudioServer.get_bus_index("SFX")
		AudioServer.set_bus_volume_linear(bus, x / 100.0)
		sfx_volume = x
		
signal settings_changed(setting: StringName, value: Variant)

var music_volume : float:
	set(x):
		var bus := AudioServer.get_bus_index("Music")
		AudioServer.set_bus_volume_db(bus, linear_to_db(x / 100.0))
		music_volume = x
		settings_changed.emit(&"music_volume", x)

func _init() -> void:
	master_volume = 50.0
	speech_volume = 80.0
	sfx_volume = 60.0
	music_volume = 20.0

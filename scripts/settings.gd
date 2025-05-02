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
		
var music_volume : float:
	set(x):
		var bus := AudioServer.get_bus_index("Music")
		AudioServer.set_bus_volume_linear(bus, x / 100.0)
		music_volume = x

func _init() -> void:
	master_volume = 25.0
	speech_volume = 25.0
	sfx_volume = 25.0
	music_volume = 25.0

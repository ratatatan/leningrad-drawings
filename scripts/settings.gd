extends Node

var menu_intro_enabled := true
var volume := 50.0:
	set(x):
		var master := AudioServer.get_bus_index("Master")
		AudioServer.set_bus_volume_linear(master, x / 50.0)
		volume = x
var animations := true

extends Node

var menu_intro_enabled := true
var animations := true

var volume := 25.0:
	set(x):
		var master := AudioServer.get_bus_index("Master")
		AudioServer.set_bus_volume_linear(master, x / 100.0)
		volume = x
		

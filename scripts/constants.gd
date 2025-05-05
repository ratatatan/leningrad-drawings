extends Node

const lorem_ipsum := "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

var main_scene: PackedScene
var menu_scene: PackedScene
var info_scene: PackedScene
var settings_scene: PackedScene

func _init() -> void:
	main_scene = preload("res://scenes/main.tscn")
	menu_scene = preload("res://scenes/menu.tscn")
	info_scene = preload("res://scenes/info.tscn")
	settings_scene = preload("res://scenes/settings.tscn")

func get_main_scene() -> PackedScene:
	return preload("res://scenes/main.tscn")

func get_menu_scene() -> PackedScene:
	return preload("res://scenes/menu.tscn")

func get_info_scene() -> PackedScene:
	return preload("res://scenes/info.tscn")

func get_settings_scene() -> PackedScene:
	return preload("res://scenes/settings.tscn")

extends Node

const lorem_ipsum := "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

var main_scene: PackedScene
var menu_scene: PackedScene
var info_scene: PackedScene
var settings_scene: PackedScene

var book_sounds: Dictionary
var album_pages: Array[Page]
var diary_pages: Array[Page]

func _init() -> void:
	main_scene = preload("res://scenes/main.tscn")
	menu_scene = preload("res://scenes/menu.tscn")
	info_scene = preload("res://scenes/info.tscn")
	settings_scene = preload("res://scenes/settings.tscn")
	
	book_sounds = {
		"book_open": preload("res://assets/audio/other/book_sounds/book-open.wav"),
		"book_close": preload("res://assets/audio/other/book_sounds/close-book.wav"),
		"pages": []
	}
	for i in range(1, 21):
		book_sounds["pages"].append(
			load("res://assets/audio/other/book_sounds/pg%d.wav" % i)
		)
	
	for i in range(1, 16):
		album_pages.append(
			load("res://resources/album_pages/album_page%d.tres" % i)
		)
	
	for i in range(1, 6):
		diary_pages.append(
			load("res://resources/diary_pages/diary_page%d.tres" % i)
		)

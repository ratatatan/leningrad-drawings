extends Panel

@export var pages: Array[Page]

@onready var image := $Image
@onready var desc := $Description

var playback: AudioStreamPlayback
var current_page: int = 0:
	set(x): current_page = clamp(x, 0, pages.size()-1)


func _ready():
	_load_page(0)

func _load_page(page_index: int):
	var new_page := pages[page_index]
	if new_page.image:
		image.texture = new_page.image
	else:
		image.texture = load("res://icon.svg")
	
	if new_page.text:	
		desc.text = new_page.text
	else:
		desc.text = Settings.lorem_ipsum
	
	if playback:
		playback.stop()
	if new_page.audio:
		playback = new_page.audio.instantiate_playback()
		playback.start()
		print("playback started")


func _change_page(page_index: int):
	# Transition magic goes here .......
	_load_page(page_index)


func _on_back_pressed() -> void:
	current_page -= 1
	_change_page(current_page)


func _on_next_pressed() -> void:
	current_page += 1
	_change_page(current_page)


func _on_close_pressed() -> void:
	visible = false

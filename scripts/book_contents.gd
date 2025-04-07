extends ReadableContents

@export var pages: Array[Page]
@export var player : AudioStreamPlayer

@onready var image := $Image
@onready var desc := $Description
@onready var title := $Title

var current_page: int = 0:
	set(x): current_page = clamp(x, 0, pages.size()-1)


func open():
	visible = true
	load_page(current_page)


func close():
	visible = false
	if player != null:
		player.stop()


func load_page(page_index: int):
	var new_page := pages[page_index]
	if new_page.image:
		image.texture = new_page.image
	else:
		image.texture = preload("res://icon.svg")
	
	if new_page.text:	
		desc.text = new_page.text
	else:
		desc.text = Settings.lorem_ipsum
		
	if new_page.title:	
		title.text = new_page.title
	else:
		title.text = Settings.lorem_ipsum
	
	if player != null and player.playing:
		player.stop()
	if new_page.audio:
		player.stream = new_page.audio
		player.play()
	else:
		player = null


func change_page(page_index: int):
	# Transition magic goes here .......
	load_page(page_index)
	if player != null:
		player.play()


func _on_back_pressed() -> void:
	current_page -= 1
	change_page(current_page)


func _on_next_pressed() -> void:
	current_page += 1
	change_page(current_page)


func _on_close_pressed() -> void:
	close()

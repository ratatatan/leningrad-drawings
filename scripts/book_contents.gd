extends ReadableContents

@export var pages: Array[Page]
@export var player : AudioStreamPlayer
@export var pages_audio : AudioStreamPlayer
@export var pages_sounds : Array[AudioStreamWAV]

@onready var image := $Image
@onready var desc := $Description
@onready var title := $Title


var current_page: int = 0:
	set(x): current_page = clamp(x, 0, pages.size()-1)


func open():
	visible = true
	change_page(current_page)
	


func close():
	visible = false
	if player:
		player.stop()


func init_page(page_index: int):
	var new_page := pages[page_index]
	if new_page.image:
		image.texture = new_page.image
	else:
		image.texture = preload("res://icon.svg")
	
	if new_page.text:	
		desc.text = new_page.text
	else:
		desc.text = Constants.lorem_ipsum
		
	if new_page.title:	
		title.text = new_page.title
	else:
		title.text = Constants.lorem_ipsum
	
	if player and player.playing:
		player.stop()
	if new_page.audio:
		player.stream = new_page.audio
	pages_audio.stream = pages_sounds.pick_random()
	pages_audio.pitch_scale = randf_range(0.8, 1.2)


func change_page(page_index: int):
	# Transition magic goes here .......
	init_page(page_index)
	if pages_audio:
		pages_audio.play()
		#await get_tree().create_timer(0.7).timeout
	if player:
		player.play()


func _on_back_pressed() -> void:
	current_page -= 1
	change_page(current_page)


func _on_next_pressed() -> void:
	current_page += 1
	change_page(current_page)


func _on_close_pressed() -> void:
	close()

extends ReadableContents

@export var pages: Array[Page]

var pages_sounds : Array[AudioStreamWAV]

@onready var main: Main = $"../.."
@onready var image := $Image
@onready var desc := $Description
@onready var title := $Title

var current_page := 0:
	set(x): current_page = clamp(x, 0, pages.size()-1)
var last_page := 0

func _init() -> void:
	for i in range(1, 21):
		pages_sounds.append(
			load("res://assets/audio/other/book_sounds/pg%d.wav" % i))

func open() -> void:
	visible = true
	open_on_page(current_page)

func close() -> void:
	visible = false
	
	# Stop speech if its already playing
	main.stop_speech()
	main.stop_sfx()
	await main.play_sfx(preload("res://assets/audio/other/book_sounds/close-book.wav"))
	# Prevent speech from playing
	main.stop_speech()

func init_page(page_index: int) -> void:
	var new_page := pages[page_index]
	main.stop_speech()
	
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

func open_on_page(page_index: int) -> void:
	init_page(page_index)
	
	await main.play_sfx(preload("res://assets/audio/other/book_sounds/book-open.wav"))
	if pages[page_index].audio:
		main.play_speech(pages[page_index].audio)

func update_page() -> void:
	print("Changing page from %s to %s" % [last_page, current_page])
	if last_page == current_page: return
	last_page = current_page
	
	init_page(current_page)
	
	await main.play_sfx(pages_sounds.pick_random())
	if pages[current_page].audio:
		main.play_speech(pages[current_page].audio)

func _on_back_pressed() -> void:
	current_page -= 1
	update_page()

func _on_next_pressed() -> void:
	current_page += 1
	update_page()

func _on_close_pressed() -> void:
	close()

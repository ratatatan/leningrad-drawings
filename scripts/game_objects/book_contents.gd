extends ReadableContents

@export var pages: Array[Page]

var pages_sounds : Array[AudioStreamWAV]

@onready var speech_player: AudioStreamPlayer = $"../../SpeechPlayer"
@onready var sfx_player: AudioStreamPlayer = $"../../SFXPlayer"
@onready var image := $Image
@onready var desc := $Description
@onready var title := $Title

var current_page: int = 0:
	set(x): current_page = clamp(x, 0, pages.size()-1)
var last_page: int = 0

func _init() -> void:
	for i in range(1, 21):
		pages_sounds.append(
			load("res://assets/audio/other/book_sounds/pg%d.wav" % i))

func open() -> void:
	visible = true
	open_on_page(current_page)

func close() -> void:
	visible = false
	speech_player.stop()
	sfx_player.stream = \
		preload("res://assets/audio/other/book_sounds/close-book.wav")
	sfx_player.play()

func init_page(page_index: int) -> void:
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
	
	if speech_player.playing:
		speech_player.stop()
	if new_page.audio:
		speech_player.stream = new_page.audio
	else:
		speech_player.stream = null
	
	sfx_player.stream = \
		load("res://assets/audio/other/book_sounds/pg%d.wav" % randi_range(0, 20))
	sfx_player.pitch_scale = randf_range(0.8, 1.2)

func open_on_page(page_index: int) -> void:
	init_page(page_index)
	sfx_player.stream = \
		preload("res://assets/audio/other/book_sounds/book-open.wav")
	sfx_player.play()
	await sfx_player.finished
	speech_player.play()

func change_page(page_index: int) -> void:
	if last_page == current_page: return
	
	init_page(page_index)
	sfx_player.play()
	await sfx_player.finished
	speech_player.play()
	
	last_page = current_page

func _on_back_pressed() -> void:
	current_page -= 1
	change_page(current_page)

func _on_next_pressed() -> void:
	current_page += 1
	change_page(current_page)

func _on_close_pressed() -> void:
	close()

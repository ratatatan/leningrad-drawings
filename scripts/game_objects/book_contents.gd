extends ReadableContents

enum BookType {
	ALBUM,
	DIARY
}

@export var book_type: BookType
@export var button_next: Button
@export var button_back: Button

var current_page := 0:
	set(x): current_page = clamp(x, 0, pages.size()-1)
var last_page := 0

var tween: Tween

@onready var pages : Array[Page] = \
	Constants.album_pages if book_type == BookType.ALBUM else \
	Constants.diary_pages if book_type == BookType.DIARY else \
	null
@onready var main: Main = $"../.."
@onready var image := $Image
@onready var desc := $Description
@onready var title := $Title

func _ready() -> void:
	if Settings.animations_enabled:
		fade_out(0)

func open() -> void:
	visible = true
	open_on_page(current_page)

func close() -> void:
	visible = false
	# Stop speech if its already playing
	main.stop_speech()
	main.stop_sfx()
	await main.play_sfx(Constants.book_sounds["book_close"])
	# Prevent speech from playing
	main.stop_speech()
	fade_out(0)

func fade_out(delta: float = 0.5) -> void:
	tween = create_tween().set_ease(Tween.EASE_OUT) \
	.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(image, "modulate", Color.TRANSPARENT, delta)
	tween.parallel().tween_property(title, "modulate", Color.TRANSPARENT, delta)
	tween.parallel().tween_property(desc, "modulate", Color.TRANSPARENT, delta)

func fade_in(delta: float = 0.5) -> void:
	tween = create_tween().set_ease(Tween.EASE_OUT) \
	.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(image, "modulate", Color.WHITE, delta)
	tween.parallel().tween_property(title, "modulate", Color.WHITE, delta)
	tween.parallel().tween_property(desc, "modulate", Color.WHITE, delta)

func init_page(page_index: int) -> void:
	var new_page : Page = pages[page_index]
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
		
	button_back.disabled = (page_index == 0)
	button_next.disabled = (page_index + 1 == len(pages))
		

func open_on_page(page_index: int) -> void:
	init_page(page_index)
	
	if Settings.animations_enabled:
		fade_in()
	
	await main.play_sfx(Constants.book_sounds["book_open"])
	if pages[page_index].audio:
		main.play_speech(pages[page_index].audio)

func update_page() -> void:
	print("Changing page from %s to %s" % [last_page, current_page])
	if last_page == current_page: return
	last_page = current_page
	
	if Settings.animations_enabled:
		fade_out()
		await tween.finished
		
	init_page(current_page)
	
	if Settings.animations_enabled:
		fade_in()
	
	await main.play_sfx(Constants.book_sounds["pages"].pick_random())
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

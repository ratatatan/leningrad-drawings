class_name Subtitles extends Panel

@onready var display: RichTextLabel = $Display

class Subtitle:
	var text: String
	var delay: float
	func  _init(t: String, d: float) -> void:
		text = t
		delay = d

var captions: Array[Subtitle]

func preload_captions(subtitles: Array[String], delays: Array[float]) -> void:
	if not Settings.subtitles_enabled: return
	close_captions()
	for i in range(len(subtitles)):
		captions.append(Subtitle.new(subtitles[i], delays[i]))

func display_captions() -> void:
	if not Settings.subtitles_enabled: return
	visible = true
	for c in captions:
		display.text = c.text
		await get_tree().create_timer(c.delay).timeout
	close_captions()

func close_captions() -> void:
	if not Settings.subtitles_enabled: return
	visible = false
	captions = []

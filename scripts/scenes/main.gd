class_name Main extends Control

@onready var speech_player: AudioStreamPlayer = %SpeechPlayer
@onready var sfx_player: AudioStreamPlayer = %SFXPlayer
@onready var subtitles_node: RichTextLabel = %Subtitles

#var sub_instance : RichTextLabel

func play_sfx(sound: AudioStreamWAV) -> void:
	if Settings.sfx_volume == 0.0:
		return
		
	sfx_player.stop()
	sfx_player.stream = sound
	sfx_player.play()
	await sfx_player.finished

func play_speech(speech: SubtitledAudio) -> void:
	if Settings.speech_volume == 0.0:
		return
	
	speech_player.stop()
	speech_player.stream = speech.stream
	speech_player.play()
	
	if Settings.subtitles_enabled:
		create_subs(speech.subtitles)
		
func stop_sfx() -> void:
	sfx_player.stream = null
	sfx_player.stop()

func stop_speech() -> void:
	if Settings.subtitles_enabled:
		clear_subs()
	speech_player.stop()

func create_subs(subtitles: Array[Subtitle]) -> void:
	clear_subs()
	
	var sub_instance := subtitles_node.duplicate()
	subtitles_node.add_sibling(sub_instance)
	sub_instance.add_to_group(&"subtitles")
	sub_instance.visible = true
	
	for sub in subtitles:
		if not sub_instance: return
		sub_instance.text = sub.text
		await get_tree().create_timer(sub.duration).timeout
	sub_instance.queue_free()

func clear_subs() -> void:
	for sub in get_tree().get_nodes_in_group(&"subtitles"):
		sub.queue_free()

func _on_close_pressed() -> void:
	get_tree().change_scene_to_packed(Constants.menu_scene)

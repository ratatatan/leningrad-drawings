class_name Main extends Control

@onready var speech_player: AudioStreamPlayer = %SpeechPlayer
@onready var sfx_player: AudioStreamPlayer = %SFXPlayer
@onready var music_player: AudioStreamPlayer = %MusicPlayer
@onready var subtitles: RichTextLabel = %Subtitles


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
	var last_stream = speech.stream.get_rid()
	speech_player.play()
	
	if Settings.subtitles_enabled:
		subtitles.visible = true
		for line in speech.lines:
			subtitles.text = line
			await get_tree().create_timer(speech.lines[line]).timeout
			if last_stream != speech_player.stream.get_rid(): break
		subtitles.visible = false
		
func stop_sfx() -> void:
	sfx_player.stream = null
	sfx_player.stop()

func stop_speech() -> void:
	if Settings.subtitles_enabled:
		subtitles.visible = false
	#speech_player.stream = null
	speech_player.stop()

func _on_close_pressed() -> void:
	get_tree().change_scene_to_packed(Constants.get_menu_scene())

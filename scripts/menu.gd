extends Control

var tween_elements: Tween
var tween_background: Tween

@onready var side_panel: Panel = $SidePanel
@onready var title: Control = $Title
@onready var background: TextureRect = $Background
@onready var animation_player: AnimationPlayer = $Background/AnimationPlayer


func _ready() -> void:
	animation_player.active = Settings.animations
	introduction()


func introduction() -> void:
	# Intro
	if Settings.menu_intro_enabled:
		side_panel.position.x = -1278.72 
		title.position.y = -967.0
		
		tween_elements = create_tween().set_ease(Tween.EASE_IN) \
			.set_trans(Tween.TRANS_CUBIC)
		tween_elements.tween_interval(0.5)

		tween_elements.tween_property(side_panel, "position:x", 0.0, 0.5)
		
		tween_elements.parallel() \
			.tween_property(title, "position:y", 0.0, 0.5)

func transition() -> void:
	Settings.menu_intro_enabled = false

func change_scene(new_scene: PackedScene) -> void:
	transition()
	get_tree().change_scene_to_packed(new_scene)

func _on_launch_pressed() -> void:
	change_scene(Constants.get_main_scene())

func _on_info_pressed() -> void:
	change_scene(Constants.get_info_scene())

func _on_settings_pressed() -> void:
	change_scene(Constants.get_settings_scene())


#func _on_exit_pressed() -> void:
	#get_tree().quit()

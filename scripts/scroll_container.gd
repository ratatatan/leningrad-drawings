extends ScrollContainer

var scroll_speed = 30  
var tween: Tween

func _ready():
	await get_tree().process_frame
	start_scrolling()

func start_scrolling():
	tween = create_tween().set_loops() 
	var max_scroll = get_v_scroll_bar().max_value

	tween.tween_property(self, "scroll_vertical", max_scroll, max_scroll / scroll_speed)
	tween.tween_property(self, "scroll_vertical", 0, max_scroll / scroll_speed)

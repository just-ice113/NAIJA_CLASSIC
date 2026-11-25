extends CanvasLayer

func _ready():
	layer = 128
	
	var btn = Button.new()
	btn.text = " BACK TO EDITOR "
	btn.rect_position = Vector2(20, 20)
	btn.rect_min_size = Vector2(100, 45)
	btn.connect("pressed", self, "_on_exit_pressed")
	add_child(btn)

func _on_exit_pressed():
	# In the Android Godot editor, this cleanly returns to project manager/editor
	OS.set_window_fullscreen(false)
	get_tree().change_scene("")

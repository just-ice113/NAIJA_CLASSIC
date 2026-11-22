extends CanvasLayer

func _ready():
	# Make sure it renders on top of everything
	layer = 128
	
	# Create a clean Exit button in the top corner
	var btn = Button.new()
	btn.text = " EXIT "
	btn.rect_position = Vector2(20, 20)
	btn.rect_min_size = Vector2(80, 40)
	btn.connect("pressed", self, "_on_quit_pressed")
	add_child(btn)

func _unhandled_input(event):
	# Catches the Android Back button
	if event.is_action_pressed("ui_cancel") or (event is InputEventKey and event.scancode == KEY_BACK):
		get_tree().quit()

func _on_quit_pressed():
	get_tree().quit()
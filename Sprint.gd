extends Sprite

var is_dragging = false
var drag_offset = Vector2.ZERO

func _ready():
    # Make sure the node can receive input events
    set_process_input(true)

func _input(event):
    if event is InputEventScreenTouch or event is InputEventMouseButton:
        if event.pressed:
            # Check if touch/click is roughly within the card bounds
            if get_rect().has_point(to_local(event.position)):
                is_dragging = true
                drag_offset = position - event.position
        else:
            is_dragging = false

func _process(delta):
    if is_dragging:
        # Follow the touch/mouse position smoothly
        position = get_global_mouse_position() + drag_offset

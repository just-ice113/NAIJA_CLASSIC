tool
extends Sprite

# Card Game Data
export var card_suit: String = "circle" # Options: circle, cross, square, star, triangle
export var card_number: int = 1         # Number value (1 to 14)

var is_dragging = false
var drag_offset = Vector2.ZERO

func _ready():
    update_card_texture()

func update_card_texture():
    # Builds path matching your file names: res://circle1.png, res://cross2.png, etc.
    var texture_path = "res://" + card_suit.to_lower() + str(card_number) + ".png"
    
    if ResourceLoader.exists(texture_path):
        texture = load(texture_path)
    else:
        print("Texture not found: ", texture_path)

func _input(event):
    if event is InputEventScreenTouch or event is InputEventMouseButton:
        if event.pressed:
            if get_rect().has_point(to_local(event.position)):
                is_dragging = true
                drag_offset = position - event.position
        else:
            is_dragging = false

func _process(delta):
    if is_dragging:
        position = get_global_mouse_position() + drag_offset

extends TileMapLayer

@export var parallax_scale_cloud: float = 0.2  # Lower = further away
@onready var bg = get_node("../Background")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var camera = get_viewport().get_camera_2d()
	if camera:
		global_position.x = camera.global_position.x * parallax_scale_cloud
		global_position.y = camera.global_position.y * bg.parallax_scale_bg

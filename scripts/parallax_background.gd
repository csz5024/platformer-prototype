extends ParallaxBackground

@export var player_path: NodePath
 
func _ready() -> void:
	var player = get_node_or_null(player_path)
	if player:
		scroll_base_offset = player.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

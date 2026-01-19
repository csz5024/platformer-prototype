# door.gd
extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var fade_overlay: ColorRect = $FadeOverlay

var is_open := false
var player_nearby := false
var player_ref: CharacterBody2D = null
var is_transitioning := false


func _ready() -> void:
	sprite.play("closed")
	# Setup fade overlay
	fade_overlay.color = Color(0, 0, 0, 0)  # Start transparent
	fade_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _process(_delta: float) -> void:
	# Interact with E key when nearby
	if player_nearby and not is_transitioning and Input.is_action_just_pressed("interact"):
		enter_door()


func enter_door() -> void:
	if not player_ref:
		return
	
	is_transitioning = true
	is_open = true
	sprite.play("opened")
	
	# Disable player input
	player_ref.set_physics_process(false)
	player_ref.set_process(false)
	player_ref.velocity = Vector2.ZERO
	
	# Snap player to door center
	var tween = create_tween()
	tween.set_parallel(true)
	
	# Move player to door position (X axis only, keep player's Y)
	var target_pos = Vector2(global_position.x, player_ref.global_position.y)
	tween.tween_property(player_ref, "global_position", target_pos, 0.3).set_ease(Tween.EASE_IN)
	
	# Fade player out (modulate alpha)
	tween.tween_property(player_ref, "modulate:a", 0.0, 0.4).set_delay(0.2)
	
	# Fade screen to black
	tween.tween_property(fade_overlay, "color:a", 1.0, 0.5).set_delay(0.3)
	
	# Wait for animation to complete, then reset
	await tween.finished
	await get_tree().create_timer(0.3).timeout
	
	# Reset the scene
	get_tree().reload_current_scene()


func close_door() -> void:
	is_open = false
	sprite.play("closed")
	collision.set_deferred("disabled", false)


func _on_interaction_area_body_entered(body: Node2D) -> void:
	print("Body entered: ", body.name, " Groups: ", body.get_groups())
	if body.is_in_group("player"):
		player_nearby = true
		player_ref = body as CharacterBody2D
		print("Player nearby - press E to interact")


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_nearby = false
		player_ref = null

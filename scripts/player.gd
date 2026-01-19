extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -650.0

@onready var animated_sprite = $AnimatedSprite2D
var is_attacking := false

func _physics_process(delta: float) -> void:	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle attack.
	if not is_attacking:
		if Input.is_action_just_pressed("attack1"):
			play_attack("attack1")
		elif Input.is_action_just_pressed("attack2"):
			play_attack("attack2")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
		
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if not is_attacking:
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")		
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func play_attack(attack_name: String) -> void:
	is_attacking = true
	animated_sprite.play(attack_name)
 
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation in ["attack1", "attack2"]:
		is_attacking = false
		animated_sprite.play("idle")  # Return to idle

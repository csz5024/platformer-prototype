extends Node2D  # This script extends Node2D

# Variables
var health: int = 100
var speed: float = 200.0
var player_name := "Hero"  # Type inferred

# Constants
const MAX_HEALTH = 100

# Called when node enters the scene tree
func _ready():
	print("Game started!")

# Called every frame (use for non-physics logic)
func _process(delta: float):
	pass  # delta = time since last frame

# Called at fixed intervals (use for physics)
func _physics_process(delta: float):
	pass

# Custom function
func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		die()

func die():
	queue_free()  # Remove this node

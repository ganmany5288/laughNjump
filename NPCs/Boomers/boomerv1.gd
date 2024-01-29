extends CharacterBody2D

var running: bool = false
var boomerv1_sprite: Node2D

func _ready():
	# Get a reference to the "Boomerv1Sprite" child node
	boomerv1_sprite = $Boomerv1Sprite

# Function to start the animation
func start_running():
	running = true
	boomerv1_sprite.get_node("Timer").start()

# Function to stop the animation
func stop_running():
	running = false
	boomerv1_sprite.get_node("Timer").stop()

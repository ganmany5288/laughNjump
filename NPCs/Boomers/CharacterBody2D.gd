extends CharacterBody2D

var movement_speed: float = 200.0
var movement_target_position: Vector2

@onready var navigation_agent: NavigationAgent2D = $boomerv1sprite/NavigationAgent2D
@onready var left_foot: Node2D = $boomerv1sprite/left_feet
@onready var right_foot: Node2D = $boomerv1sprite/right_feet

var foot_phase = 0.0  # feet sin phase
const FOOT_MOVE_AMPLITUDE = 4  
const FOOT_MOVE_SPEED = 10# change as necessary

#uregncy relatied varibles
var max_urgency: float = 100.0
var current_urgency: float = 0.0
var urgency_increase_rate: float = 1.0  # Urgency increase per second

@onready var urgency_bar: ProgressBar = $urgency_bar

var urinal_zone_rect: Rect2 = Rect2(Vector2(100, 100), Vector2(200, 200)) # urinal area for now

func _ready():
	navigation_agent.path_desired_distance =   4.0
	navigation_agent.target_desired_distance = 4.0
	set_process_input(true)
	# Initialize
	urgency_bar.max_value = max_urgency
	urgency_bar.value = current_urgency
	set_process(true)  # Make sure _process is called

	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		movement_target_position = get_global_mouse_position()
		set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		velocity = Vector2.ZERO
	else:
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		velocity = current_agent_position.direction_to(next_path_position) * movement_speed
		animate_feet(delta)  # calls the kawaii feet animation
	
	move_and_slide()

func _process(delta):
	# Increase urgency unless in urinal zone
	if not urinal_zone_rect.has_point(global_position):
		current_urgency += urgency_increase_rate * delta
		current_urgency = min(current_urgency, max_urgency)  # Cap urgency at max_urgency
	else:
		# holds urgency until piss bar = 100
		pass
	update_urgency_bar()

func update_urgency_bar():
	urgency_bar.value = current_urgency

func animate_feet(delta):
	foot_phase += FOOT_MOVE_SPEED * delta
	var foot_move_amount = sin(foot_phase) * FOOT_MOVE_AMPLITUDE
	left_foot.position.y =  foot_move_amount
	right_foot.position.y = -foot_move_amount  # opopiste pahse

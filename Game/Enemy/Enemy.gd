extends CharacterBody2D

@export var shoots = true
@export var editing: bool = false
var rng = RandomNumberGenerator.new()
var rocket_pre = preload("res://Enemy/Rocket/Terminator Rocket.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if shoots and not editing:
		$Timer.wait_time = rng.randi_range(3, 10)
		$Timer.start()

func _process(delta):
	pass

func _physics_process(delta):
	if not is_on_floor() and not editing:
		velocity.y += gravity * delta
	move_and_slide()

func _input(event):
	if editing and event.is_action_pressed("ui_rightclick"):
		print(int(shoots))
		shoots = not shoots

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		pass

func spawn_rocket():
	var r = rocket_pre.instantiate()
	add_child(r)

func _on_timer_timeout():
	spawn_rocket()
	$Timer.wait_time = rng.randi_range(5, 20)
	$Timer.start()

extends CharacterBody2D

@export var editing: bool = false
const SPEED = 300.0
const JUMP_VELOCITY = -400
var jump_count = 0
var health = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if Global.explosion:
		$Explosion.play()
		Global.explosion = false
	if Global.rocket:
		$Shoot.play()
		Global.rocket = false
	if not editing:
		if health <= 0: get_tree().change_scene_to_file("res://UI/Death.tscn")
		if not is_on_floor():
			velocity.y += gravity * delta
		
		if is_on_floor(): jump_count = 0

		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept") and (jump_count < 2 or is_on_floor()):
			jump_count += 1
			$Jump.play()
			velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed("ui_end"):
			Global.paused = not Global.paused
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()

func _on_area_2d_body_entered(body):
	if not editing:
		if body.name == "Enemy":
			health -= 5
			print(health)

func _on_area_2d_area_entered(area):
	if not editing:
		if area.name == "Enemy":
			health -= 5
			print(health)
		if area.name == "EnemyLeft":
			health -= 5
			print(health)
		if area.name == "EnemyRight":
			health -= 5
			print(health)

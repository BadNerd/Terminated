extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var mouse_sens = 0.3
var camera_anglev = 0
var jump_count = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	if is_on_floor(): jump_count = 0
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and (jump_count < 2 or is_on_floor()):
		jump_count += 1
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		var changev =- event.relative.y * mouse_sens
		if camera_anglev + changev >- 60 and camera_anglev + changev < 60:
			camera_anglev += changev
			$Camera3D.rotate_x(deg_to_rad(changev))


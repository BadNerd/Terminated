extends CharacterBody2D
var speed = 3

func _process(delta):
	velocity.x += speed
	move_and_slide()

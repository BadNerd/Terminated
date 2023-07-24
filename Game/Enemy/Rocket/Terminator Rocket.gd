extends Area2D
var speed = 8

func _process(delta):
	position.x += speed

func _on_body_entered(body):
	if body.name == "Player":
		body.health -= 50
		queue_free()

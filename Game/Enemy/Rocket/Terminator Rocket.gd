extends Area2D
var speed = 12.5

func _process(delta):
	position.x += speed

func _on_body_entered(body):
	if body.name == "Player":
		body.health -= 50
		queue_free()

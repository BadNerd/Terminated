extends Area2D
var speed = 10

func _process(delta):
	position.x += speed

func _on_area_2d_area_entered(area):
	if area.name == "Enemy":
		area.queue_free()
		queue_free()

func _on_area_2d_body_entered(body):
	if body.name == "Enemy":
		body.queue_free()
		queue_free()
	if body.name == "Terminator Rocket":
		body.queue_free()
		queue_free()
	if body.name == "Player": #or body.name == "Platforms":
		queue_free()

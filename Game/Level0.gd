extends Node2D

var r_preload = preload("res://Player/Rocket/Rocket.tscn")

func _input(event):
	if event.is_action_pressed("rocket"):
		var r = r_preload.instantiate()
		r.position.y = $Player.position.y
		#r.look_at($Player.position)
		add_child(r)

func _process(delta):
	$Bar.value = $Player.health

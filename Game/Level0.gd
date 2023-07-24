extends Node2D

@export var level_end = -1223
var r_preload = preload("res://Player/Rocket/Rocket.tscn")

func _input(event):
	if event.is_action_pressed("rocket"):
		var r = r_preload.instantiate()
		r.position.x = level_end
		r.position.y = $Player.position.y
		#r.look_at($Player.position)
		add_child(r)

func _process(delta):
	$Camera2D.position.x = min($Player.position.x-200, 0)
	$Camera2D/Bar.value = $Player.health

func _on_floor_body_entered(body):
	if body.name == "Player":
		$Player.health = 0

func _on_exit_body_entered(body):
	if body.name == "Player":
		Global.next_level()

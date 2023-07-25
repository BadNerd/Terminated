extends Node2D

@export var level_end = -2392
var r_preload = preload("res://Player/Rocket/Rocket.tscn")

func _input(event):
	if event.is_action_pressed("rocket"):
		var r = r_preload.instantiate()
		r.position.x = level_end
		r.position.y = $Player.position.y
		#r.look_at($Player.position)
		add_child(r)

func _process(delta):
	get_tree().paused = Global.paused
	if Input.is_action_just_pressed("ui_cancel"):
		Global.paused = not Global.paused
	$Camera2D.position.x = min($Player.position.x-100, 0)
	$Camera2D/Bar.value = $Player.health

func _on_floor_body_entered(body):
	if body.name == "Player":
		$Player.health = 0

func _on_exit_body_entered(body):
	if body.name == "Player":
		Global.next_level()

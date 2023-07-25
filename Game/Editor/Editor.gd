extends Control

var obj = 2
var objects = {enemies={}, platforms={}, player={"x"=0, "y"=0}}
var p_count = 0
var e_count = 0
var cx = 0
var enemy = preload("res://Enemy/Enemy.tscn")
var platform = preload("res://UI/Platform.tscn")

func _process(_delta):
	$Player.position.x = objects["player"]["x"]
	$Player.position.y = objects["player"]["y"]
	if Input.is_action_pressed("ui_left"):
		$BGS.translate(Vector2(5, 0))
		position.x = $BGS.position.x
	if Input.is_action_pressed("ui_right"):
		$BGS.translate(Vector2(-5, 0))
		position.x = $BGS.position.x

func _unhandled_input(event):
	if event.is_action_pressed("ui_rightclick"):
		objects["player"]["x"] = make_canvas_position_local(get_viewport().get_mouse_position()).x
		objects["player"]["y"] = make_canvas_position_local(get_viewport().get_mouse_position()).y
	if event.is_action_pressed("place"):
		if obj == 1:
			var clone = enemy.instantiate()
			clone.editing = true
			clone.position = get_global_mouse_position()
			objects["enemies"][e_count] = {}
			objects["enemies"][e_count]["x"]=clone.position.x
			objects["enemies"][e_count]["y"]=clone.position.y
			objects["enemies"][e_count]["shoots"]=int(clone.shoots)
			e_count+=1
			add_child(clone)
		elif obj == 2:
			var clone = platform.instantiate()
			clone.position = get_global_mouse_position()
			objects["platforms"][p_count] = {}
			objects["platforms"][p_count]["x"]=clone.position.x
			objects["platforms"][p_count]["y"]=clone.position.y
			print(objects["platforms"][p_count])
			p_count+=1
			$Blocks.add_child(clone)

func _on_terminator_pressed():
	obj = 1
	print(obj)

func _on_button_pressed():
	obj = 2
	print(obj)

func save_map():
	var json_data := JSON.stringify(objects)
	var file_access := FileAccess.open("user://test.map", FileAccess.WRITE)
	file_access.store_line(json_data)
	file_access.close()

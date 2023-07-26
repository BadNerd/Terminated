extends Node2D

@export var level_end: int = -1223
@export var import_json: bool = false
@export var editing: bool = false
var filename = null
var r_preload = preload("res://Player/Rocket/Rocket.tscn")
var p_preload = preload("res://UI/Platform.tscn")
var e_preload = preload("res://Enemy/Enemy.tscn")

func _input(event):
	if event.is_action_pressed("rocket") and not editing:
		var r = r_preload.instantiate()
		r.position.x = level_end
		r.position.y = $Player.position.y
		#r.look_at($Player.position)
		add_child(r)

func _process(delta):
	get_tree().paused = Global.paused
	#if Input.is_action_just_pressed("ui_cancel"):
	#	Global.paused = true
	if not editing:
		$Camera2D.position.x = min($Player.position.x-200, 0)
		$Camera2D/Bar.value = $Player.health

func _on_floor_body_entered(body):
	if body.name == "Player":
		$Player.health = 0

func _ready():
	if import_json:
		$Player.editing = true
		$FileDialog.popup()

func _on_exit_body_entered(body):
	if body.name == "Player":
		if import_json:
			Global.level = 10
		Global.next_level()

func _load(map, p):
	if not FileAccess.file_exists(p):
		return
	var file_access := FileAccess.open(p, FileAccess.READ)
	var json_data := file_access.get_line()
	file_access.close()
	var data: Dictionary = JSON.parse_string(json_data)
	print(data)
	for i in data["platforms"].values():
		var clone = p_preload.instantiate()
		clone.position.x = i["x"]
		clone.position.y = i["y"]
		$Level/Platform.add_child(clone)
	for i in data["enemies"].values():
		var clone = e_preload.instantiate()
		clone.position.x = i["x"]
		clone.position.y = i["y"]
		clone.shoots = bool(i["shoots"])
		$Level/Enemies.add_child(clone)
	$Player.position.x = data["player"]["x"]
	$Player.position.y = data["player"]["y"]
	$Level/Exit.position.x = data["exit"]["x"]
	$Level/Exit.position.y = data["exit"]["y"]

func _on_file_dialog_file_selected(path):
	Global.path = path
	_load(self, path)
	Global.level = 10
	$Player.editing = false

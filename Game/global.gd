extends Node

var level: int = 0
var health: int = 100
const max_level: int = 1

func teleport_level():
	get_tree().change_scene_to_file("res://Level"+str(level)+".tscn")

func next_level():
	if level >= max_level:
		get_tree().change_scene_to_file("res://UI/Win.tscn")
	else:
		level += 1
		teleport_level()

extends Control

func _on_levels_pressed():
	get_tree().change_scene_to_file("res://UI/Levels.tscn")

func _on_editor_pressed():
	get_tree().change_scene_to_file("res://Editor/Editor.tscn")

func _on_exit_pressed():
	get_tree().quit()

func _on_import_pressed():
	get_tree().change_scene_to_file("res://Editor/LevelImport.tscn")

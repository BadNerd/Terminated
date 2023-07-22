extends Control

func _on_respawn_pressed():
	get_tree().change_scene_to_file("res://Level0.tscn")

func _on_exit_pressed():
	get_tree().quit()

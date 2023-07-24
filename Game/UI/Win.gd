extends Control

func _on_replay_pressed():
	get_tree().change_scene_to_file("res://Level0.tscn")

func _on_exit_pressed():
	get_tree().quit()

func _on_texture_button_pressed():
	print("This was taken from the internet!")

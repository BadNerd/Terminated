extends Control

func _on_respawn_pressed():
	Global.teleport_level()

func _on_exit_pressed():
	get_tree().quit()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://UI/Main Menu.tscn")

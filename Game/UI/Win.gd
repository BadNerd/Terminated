extends Control

func _on_replay_pressed():
	Global.level = 0
	Global.teleport_level()

func _on_exit_pressed():
	get_tree().quit()

func _on_texture_button_pressed():
	print("This was taken from the internet!")

extends Control

func _on_respawn_pressed():
	Global.teleport_level()

func _on_exit_pressed():
	get_tree().quit()

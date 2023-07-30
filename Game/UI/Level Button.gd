extends NinePatchRect


@export var level_scene : PackedScene
@export var level_text : int
func _ready():
	$Label.text = str(level_text)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_gui_input(event):
	if (event is InputEventMouseButton) and (event.get_button_index() == MOUSE_BUTTON_LEFT) :
		get_tree().change_scene_to_file(level_scene.resource_path)

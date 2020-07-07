extends "res://Scripts/HoverInfo.gd"

func _on_HoverInfo_mouse_entered():
	var levelTextBox = get_node("/root/Battle/Level4").find_node("t_level_description")
	
	if levelTextBox != null:
		levelTextBox.text = description

func _on_HoverInfo_mouse_exited():
	var levelTextBox = get_node("/root/Battle/Level4").find_node("t_level_description")
	
	if levelTextBox != null:
		levelTextBox.text = ""

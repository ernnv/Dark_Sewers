extends Control

export(String, MULTILINE) var  description = ""

func _on_HoverInfo_mouse_entered():
	print(description)
	var main = get_tree().current_scene
	var textbox = main.find_node("t_description")
	
	if textbox != null:
		textbox.text = description

func _on_HoverInfo_mouse_exited():
	var main = get_tree().current_scene
	var textbox = main.find_node("t_description")
	
	if textbox != null:
		textbox.text = ""

extends Button

func _on_b_quit_pressed():
	var main =  get_node("/root/Battle")
	return main.get_tree().quit()

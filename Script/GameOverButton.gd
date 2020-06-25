extends Button

func _on_b_gameover_pressed():
	var main =  get_node("/root/Battle")
	return main.get_tree().reload_current_scene()

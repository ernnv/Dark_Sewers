extends Control

onready var animationPlayer  = $AnimationPlayer

func _ready():
	set_black_screen()
	yield(animationPlayer, "animation_finished")
	
	set_died_text()
	yield(animationPlayer, "animation_finished")
	
	for button in $g_gameover.get_children():
		button.show()

func set_black_screen():
	animationPlayer.play("anim_blackscreen")

func set_died_text():
	animationPlayer.play("anim_you_died")

func _on_b_retry_pressed():
	var main = get_node("/root/Battle")
	main.get_tree().reload_current_scene()

func _on_b_quit_pressed():
	var main = get_node("/root/Battle")
	main.get_tree().quit()

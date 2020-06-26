extends Control

onready var animationPlayer  = $AnimationPlayer
onready var gameOverButton = $b_retry
onready var quitButton = $b_quit

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	set_black_screen()
	
	yield(get_tree().create_timer(1), "timeout")
	set_died_text()
	
	yield(get_tree().create_timer(2), "timeout")
	gameOverButton.show()
	quitButton.show()

func set_black_screen():
	animationPlayer.play("anim_blackscreen")
	yield(animationPlayer, "animation_finished")

func set_died_text():
	animationPlayer.play("anim_you_died")
	yield(animationPlayer, "animation_finished")


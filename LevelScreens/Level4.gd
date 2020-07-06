extends Control

onready var fadeInAnimationPlayer = $FadeIn/AnimationPlayer
onready var animationPlayer = $CenterContainer/AnimationPlayer
onready var gridContainer = $GridContainer

func _ready():
	fadeInAnimationPlayer.play("anim_fadein")
	yield(fadeInAnimationPlayer, "animation_finished")
	
	animationPlayer.play("anim_level4")
	yield(animationPlayer, "animation_finished")
	
	gridContainer.show()

func _on_b_pone_sword_finished():
	gridContainer.hide()
	yield(get_tree().create_timer(1.5),"timeout")
	queue_free()

func _on_b_restore_finished():
	gridContainer.hide()
	yield(get_tree().create_timer(1.5),"timeout")
	queue_free()

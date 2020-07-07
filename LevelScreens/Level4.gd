extends Control

onready var fadeInAnimationPlayer = $FadeIn/AnimationPlayer
onready var animationPlayer = $CenterContainer/AnimationPlayer
onready var gridContainer = $GridContainer
onready var levelDescription = $p_level_description

func _ready():
	fadeInAnimationPlayer.play("anim_fadein")
	yield(fadeInAnimationPlayer, "animation_finished")
	
	animationPlayer.play("anim_level4")
	yield(animationPlayer, "animation_finished")
	
	gridContainer.show()

func _on_b_berserk_finished():
	gridContainer.hide()
	levelDescription.hide()
	yield(get_tree().create_timer(1.5),"timeout")
	
	fadeInAnimationPlayer.play("anim_fadeout")
	
	queue_free()

func _on_b_ironwill_finished():
	gridContainer.hide()
	levelDescription.hide()
	yield(get_tree().create_timer(1.5),"timeout")
	
	fadeInAnimationPlayer.play("anim_fadeout")
	
	queue_free()

func _on_b_hindsight_finished():
	gridContainer.hide()
	levelDescription.hide()
	yield(get_tree().create_timer(1.5),"timeout")
	
	fadeInAnimationPlayer.play("anim_fadeout")
	
	queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	 levelDescription.show()

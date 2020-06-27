extends "res://Scripts/Enemy.gd"

onready var laughLabel = $Laugh
onready var introLabel = $Intro

func _ready():
	BATTLE_UNITS.Enemy = self
	
	if expLabel != null:
		expLabel.text = "+" + str(experience) + "  EXP"
	
	skull_intro_animation()

func attack() -> void:
	yield(get_tree().create_timer(1), "timeout")
	
	skull_laugh_animation()
	yield(skull_laugh_animation(), "completed")
	
	animationPlayer.play("anim_attack")
	yield(animationPlayer, "animation_finished")
	
	emit_signal("end_turn")

func skull_laugh_animation():
	laughLabel.show()
	animationPlayer.play("anim_skull_laugh")
	yield(animationPlayer, "animation_finished")
	laughLabel.hide()

func skull_intro_animation():
	introLabel.show()
	animationPlayer.play("anim_skull_intro")
	yield(animationPlayer, "animation_finished")
	
	introLabel.hide()
	sprite.show()
	hpLabel.show()

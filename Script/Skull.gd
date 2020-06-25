extends "res://Script/Enemy.gd"

func _ready():
	BATTLE_UNITS.Enemy = self
	
	if expLabel != null:
		expLabel.text = "+" + str(experience) + "  EXP"
	
	skull_intro_animation()
	#yield(skull_intro_animation(), "completed")

func attack() -> void:
	yield(get_tree().create_timer(1), "timeout")
	
	skull_laugh_animation()
	yield(skull_laugh_animation(), "completed")
	
	animationPlayer.play("anim_attack")
	yield(animationPlayer, "animation_finished")
	
	emit_signal("end_turn")

func skull_laugh_animation():
	animationPlayer.play("anim_skull_laugh")
	yield(animationPlayer, "animation_finished")

func skull_intro_animation():
	animationPlayer.play("anim_skull_intro")
	yield(animationPlayer, "animation_finished")
	
	sprite.show()
	hpLabel.show()

extends Node2D

onready var sfxPlayer = $SFXSwordSlash
func _ready():
	sfxPlayer.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

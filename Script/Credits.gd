extends Control

onready var animationPlayer = $FadeIn/AnimationPlayer
onready var button = $b_return
onready var musicPlayer = $MenuMusic
onready var musicFade = $MenuMusic/MusicFade

func _ready():
	musicPlayer.play()
	fade_in_music(musicPlayer)

func fade_in_animation():
	fade_out_music(musicPlayer)
	animationPlayer.play("anim_fadein")
	yield(animationPlayer, "animation_finished")

func _on_b_return_pressed():
	yield(fade_in_animation(), "completed")
	get_tree().change_scene(button.scene_to_load)

func fade_out_music(musicPlayer):
	var fade_timer = 1.5
	var fade_type = 1 #TRANS_SINE
	musicFade.interpolate_property(musicPlayer, "volume_db", -20, -80, fade_timer, fade_type, Tween.EASE_IN, 0)
	musicFade.start()

func fade_in_music(musicPlayer):
	var fade_timer = 3
	var fade_type = 1 #TRANS_SINE
	musicFade.interpolate_property(musicPlayer, "volume_db", -80, -20, fade_timer, fade_type, Tween.EASE_IN, 0)
	musicFade.start()

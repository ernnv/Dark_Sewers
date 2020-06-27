extends Control

onready var animationPlayer = $FadeIn/AnimationPlayer
onready var musicPlayer = $MenuMusic
onready var musicFade = $MenuMusic/MusicFade

func _ready():
	for button in $MenuButtons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])
	
	musicPlayer.play()
	fade_in_music(musicPlayer)

func fade_in_animation():
	fade_out_music(musicPlayer)
	animationPlayer.play("anim_fadein")
	yield(animationPlayer, "animation_finished")

func _on_Button_pressed(scene_to_load):
	yield(fade_in_animation(), "completed")
	fade_in_animation()
	get_tree().change_scene(scene_to_load)

func _on_b_quit_pressed():
	yield(fade_in_animation(), "completed")
	fade_in_animation()
	get_tree().quit()

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

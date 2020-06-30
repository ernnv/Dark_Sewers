extends Control

onready var animationPlayer = $AnimationPlayer
onready var blockUnlockButton = $b_blockunlock
onready var sfxPlayer = $SFXPlayer

func _ready():
	set_black_screen()
	yield(animationPlayer, "animation_finished")
	
	set_well_done()
	yield(animationPlayer, "animation_finished")
	
	set_blockability_text()
	yield(animationPlayer, "animation_finished")
	
	blockUnlockButton.show()

func _on_b_blockunlock_mouse_entered():
	sfxPlayer.play()

func _on_b_blockunlock_pressed():
	var main = get_node("/root/Battle")
	main.c_buttons.show()
	main.c_buttons.find_node("BlockButton").show()
	main.nextRoomButton.show()
	queue_free()

func set_black_screen():
	animationPlayer.play("anim_blockability_fade")

func set_well_done():
	animationPlayer.play("anim_blockability_welldone")

func set_blockability_text():
	animationPlayer.play("anim_blockability_text")

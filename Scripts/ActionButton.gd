extends Button

const BATTLE_UNITS = preload("res://BattleUnits.tres")

onready var sfxPlayer = $ButtonSFX
onready var hoverInfo = $HoverInfo

func _on_pressed():
	pass # Replace with function body.


func _on_ActionButton_mouse_entered():
	sfxPlayer.play()

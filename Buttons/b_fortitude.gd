extends "res://Scripts/ActionButton.gd"

signal finished

func ready():
	hoverInfo.description = "Reduces Block CD by 1"

func _on_pressed():
	var Player = BATTLE_UNITS.Player
	
	Player.block_cd_mod = 2
	emit_signal("finished")
	queue_free()

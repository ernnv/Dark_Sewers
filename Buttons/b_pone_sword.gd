extends "res://Scripts/ActionButton.gd"

signal finished

func ready():
	hoverInfo.description = "Increases Sword Damage by 1"

func _on_pressed():
	var Player = BATTLE_UNITS.Player
	
	Player.attackmod += 1
	emit_signal("finished")
	queue_free()

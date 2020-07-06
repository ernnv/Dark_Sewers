extends "res://Scripts/ActionButton.gd"

signal finished

func ready():
	hoverInfo.description = "Replenishes health. "

func _on_pressed():
	var Player = BATTLE_UNITS.Player
	
	Player.hp = Player.max_hp
	emit_signal("finished")
	queue_free()

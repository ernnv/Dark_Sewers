extends "res://Scripts/ActionButton.gd"

signal finished

func _ready():
	hoverInfo.description = "HINDSIGHT: The god of the all-knowing gifts you with empowered healing. Heal now restores 4 HP."

func _on_pressed():
	var Player = BATTLE_UNITS.Player
	
	Player.healmod += 1
	emit_signal("finished")
	queue_free()

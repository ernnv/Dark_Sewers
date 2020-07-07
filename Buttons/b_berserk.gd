extends "res://Scripts/ActionButton.gd"

signal finished

func _ready():
	hoverInfo.description = "BERSERK: Fury blinds you, consumes you. Attack now deals 6 damage, but reduces MP gained by 1."

func _on_pressed():
	var Player = BATTLE_UNITS.Player
	
	Player.attackmod += 1
	emit_signal("finished")
	queue_free()

extends "res://Scripts/ActionButton.gd"

signal finished

func _ready():
	hoverInfo.description = "IRONWILL: Death has closed in many times before, everchasing. Restores health to max."

func _on_pressed():
	var Player = BATTLE_UNITS.Player
	
	Player.hp = Player.max_hp
	emit_signal("finished")
	queue_free()

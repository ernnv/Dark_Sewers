extends "res://Script/ActionButton.gd"

export var mana_cost = 6

func _on_pressed():
	var player = BATTLE_UNITS.Player
	
	if player != null and player.mp >= mana_cost:
		player.hp += player.HEAL
		player.mp -= mana_cost
		player.ap -= 1

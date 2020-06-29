extends "res://Scripts/ActionButton.gd"

export var mana_cost = 6

func _ready():
	var Player = BATTLE_UNITS.Player
	hoverInfo.description = "Heal Spell: Heals " + str(Player.heal + Player.healmod) + " health points. Cast on self."
	
func _on_pressed():
	var player = BATTLE_UNITS.Player
	
	if player != null and player.mp >= mana_cost:
		player.hp += (player.heal + player.healmod)
		player.mp -= mana_cost
		player.ap -= 1
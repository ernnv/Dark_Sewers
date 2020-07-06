extends "res://Scripts/ActionButton.gd"

export var mana_cost = 6

func _ready():
	var Player = BATTLE_UNITS.Player
	hoverInfo.description = "Heal Spell: Heals " + str(Player.heal + Player.healmod) + " health points. Cast on self."
	
func _on_pressed():
	var player = BATTLE_UNITS.Player
	var enemy = BATTLE_UNITS.Enemy
	
	if player != null and enemy != null and player.mp >= mana_cost:
		player.hp += (player.heal + player.healmod)
		player.mp -= mana_cost
		player.ap -= 1

func _on_PlayerStats_healmod_changed(new_healmod):
	var Player = BATTLE_UNITS.Player
	hoverInfo.description = "Heal Spell: Heals " + str(Player.heal + new_healmod) + " health points. Cast on self."

extends "res://Scripts/ActionButton.gd"

const SLASH_ANIMATION = preload("res://Animations/SwordSlash.tscn")

func _ready():
	var Player = BATTLE_UNITS.Player
	hoverInfo.description = "Sword Attack: Deals " + str(Player.attack_damage + Player.attackmod) + " damage and restores 3 MP."
	
func _on_pressed():
	var enemy = BATTLE_UNITS.Enemy
	var player = BATTLE_UNITS.Player
	
	if enemy != null and player != null:
		create_slash(enemy.global_position)
		enemy.take_damage(player.attack_damage + player.attackmod)
		player.mp  += 2
		player.ap -= 1

func create_slash(position):
	var slash = SLASH_ANIMATION.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position

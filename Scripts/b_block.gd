extends "res://Scripts/ActionButton.gd"

func _on_pressed():
	var Player = BATTLE_UNITS.Player
	var Enemy = BATTLE_UNITS.Enemy
	
	if Player.block_cd == 0 and Enemy != null :
		Player.block = true
		Player.block_cd = 3
		Player.mp += 2
		Player.ap -= 2
	else:
		print("Block Ability is on Cooldown")

func _on_PlayerStats_block_cd_changed(new_block_cd):
	self.text = "CD: " + str(new_block_cd)
	if new_block_cd == 0:
		self.text = "Block"

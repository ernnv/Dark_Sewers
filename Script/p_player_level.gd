extends Panel

onready var lvlLabel = $c_player_level/LVL
onready var expLabel = $c_player_level/EXP
onready var maxexpLabel = $c_player_level/MAXEXP

func _on_PlayerStats_level_changed(new_level):
	lvlLabel.text = "LVL\n" + str(new_level)

func _on_PlayerStats_experience_changed(new_exp):
	expLabel.text = "EXP\n" + str(new_exp)

func _on_PlayerStats_max_exp_changed(new_max_exp):
	maxexpLabel.text = "NEXT LVL\n" +  str(new_max_exp)

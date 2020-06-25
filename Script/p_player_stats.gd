extends Panel

onready var hpLabel = $c_player_stats/HP
onready var apLabel = $c_player_stats/AP
onready var mpLabel = $c_player_stats/MP

func _on_PlayerStats_hp_changed(new_hp):
	hpLabel.text = "HP\n" + str(new_hp)

func _on_PlayerStats_ap_changed(new_ap):
	apLabel.text = "AP\n" + str(new_ap)

func _on_PlayerStats_mp_changed(new_mp):
	mpLabel.text = "MP\n" + str(new_mp)

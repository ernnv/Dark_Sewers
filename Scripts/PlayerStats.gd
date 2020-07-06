extends Node

const BATTLE_UNITS = preload("res://BattleUnits.tres")

# Character Skills
var attack_damage = 4
var attackmod = 0 setget set_attackmod

var heal = 3
var healmod = 0 setget set_healmod

var block = false
var block_cd = 0 setget set_block_cd
var block_cd_mod = 3

# Character Stats
var max_hp = 25
var hp = max_hp setget set_hp

var max_ap = 3
var ap =  max_ap setget set_ap
var apmod = 0

var max_mp = 10
var mp = 0 setget set_mp

var max_level = 10
var level = 1 setget set_level

var max_exp = round(pow(level,  1.8) + level * 4) setget set_max_exp
var experience = 0 setget set_experience

signal hp_changed(new_hp)
signal ap_changed(new_ap)
signal mp_changed(new_mp)
signal level_changed(new_level)
signal experience_changed(new_exp)
signal max_exp_changed(new_max_exp)
signal block_cd_changed(new_block_cd)
signal attackmod_changed(new_attackmod)
signal healmod_changed(new_healmod)

signal end_turn
signal died

# Functions SETGET
func set_hp(new_hp):
	hp = clamp(new_hp, 0, max_hp)
	emit_signal("hp_changed", hp)
	if hp == 0:
		emit_signal("died")

func set_ap(new_ap):
	ap = clamp(new_ap, 0, max_ap)
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")
		if self.block_cd > 0:
			self.block_cd -= 1

func set_mp(new_mp):
	mp = clamp(new_mp, 0, max_mp)
	emit_signal("mp_changed", mp)

func set_level(new_level):
	level = clamp(new_level, 1, max_level)
	emit_signal("level_changed", level)

func set_experience(new_exp):
	experience += new_exp
	while experience >= max_exp:
		experience -= max_exp
		level_up()
	emit_signal("experience_changed", experience)

func set_max_exp(new_max_exp):
	max_exp = new_max_exp
	emit_signal("max_exp_changed", max_exp)

func level_up():
	self.level += 1
	self.max_exp = round(pow(self.level,  1.8) + self.level * 4)

func set_block_cd(new_block_cd):
	block_cd = clamp(new_block_cd, 0, block_cd_mod)
	emit_signal("block_cd_changed", block_cd)

func set_attackmod(new_attackmod):
	attackmod = new_attackmod
	emit_signal("attackmod_changed", attackmod)

func set_healmod(new_healmod):
	healmod = new_healmod
	emit_signal("healmod_changed", healmod)

# Functions NODE
func _ready():
	BATTLE_UNITS.Player = self

func _exit_tree():
	BATTLE_UNITS.Player = null

extends Node2D

# Variables
const BATTLE_UNITS = preload("res://BattleUnits.tres")

export(int) var hp = 25 setget set_hp
export(int) var attack_damage = 3
export(int) var experience = 4

onready var hpLabel = $l_HP
onready var expLabel = $Experience
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

signal end_turn
signal on_death

# Functions NODE
func _ready():
	BATTLE_UNITS.Enemy = self
	var Player = BATTLE_UNITS.Player
	
	if expLabel != null:
		expLabel.text = "+" + str(experience) + "  EXP"

func _exit_tree():
	BATTLE_UNITS.Enemy = null
	
# Functions SET/GET
func set_hp(new_hp):
	hp = new_hp
	if hpLabel != null:
		hpLabel.text = str(hp) + "HP"

# Functions Specific
func attack() -> void:
	yield(get_tree().create_timer(1), "timeout")
	
	animationPlayer.play("anim_attack")
	yield(animationPlayer, "animation_finished")
	
	emit_signal("end_turn")

func deal_damage():
	var Player = BATTLE_UNITS.Player
	
	if Player.block == true:
		# Create block animation
		Player.block = false
	else:
		Player.hp -= attack_damage

func take_damage(damage):
	self.hp -= damage
	if is_dead():
		emit_signal("on_death")
		give_experience()
		experience_animation() 
		yield(experience_animation(), "completed")
		queue_free()
	else:
		animationPlayer.play("anim_shake")
		yield(animationPlayer, "animation_finished")

func give_experience():
	var Player = BATTLE_UNITS.Player
	Player.experience += experience

func experience_animation():
	sprite.hide()
	hpLabel.hide()
	expLabel.show()
	
	animationPlayer.play("anim_enemy_experience")
	yield(animationPlayer, "animation_finished")

func is_dead():
	return hp <= 0
	

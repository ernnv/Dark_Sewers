extends Node

const BATTLE_UNITS = preload("res://BattleUnits.tres")
const GAMEOVER = preload("res://Prefabs/GameOver.tscn")

export(Array, PackedScene) var new_enemy = []

onready var c_buttons = $UI/c_buttons
onready var animationPlayer = $AnimationPlayer
onready var nextRoomButton = $UI/CenterContainer/NextRoomButton
onready var enemyPosition = $EnemyPosition

func _ready():
	randomize()
	start_player_turn()
	
	var enemy = BATTLE_UNITS.Enemy
	
	if enemy != null:
		enemy.connect("on_death", self, "_on_Enemy_on_death")

func start_enemy_turn():
	c_buttons.hide()
	var enemy = BATTLE_UNITS.Enemy
	
	if enemy != null and not enemy.is_queued_for_deletion():
		enemy.attack()
		yield(enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	c_buttons.show()
	var Player = BATTLE_UNITS.Player
	
	Player.ap = Player.max_ap
	yield(Player, "end_turn")
	
	start_enemy_turn()

func create_new_enemy():
	new_enemy.shuffle()
	var Enemy = new_enemy.front()
	var enemy = Enemy.instance()
	enemyPosition.add_child(enemy)
	enemy.connect("on_death", self, "_on_Enemy_on_death")

func _on_Enemy_on_death():
	c_buttons.hide()
	
	yield(get_tree().create_timer(1), "timeout")
	
	nextRoomButton.show()

func _on_NextRoomButton_pressed():
	var Player = BATTLE_UNITS.Player
	
	nextRoomButton.hide()
	
	animationPlayer.play("anim_fade_to_newroom")
	yield(animationPlayer, "animation_finished")
	
	Player.ap = Player.max_ap
	
	c_buttons.show()
	
	create_new_enemy()
	start_player_turn()

func _on_PlayerStats_died():
	c_buttons.hide()
	
	yield(get_tree().create_timer(0.5), "timeout")
	var gameOver = GAMEOVER.instance()
	add_child(gameOver)

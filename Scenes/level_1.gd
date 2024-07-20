extends Node2D

var meteor_scene: PackedScene = load("res://Scenes/meteor_1.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")

var health = 5

func _ready():
	get_tree().call_group('ui', 'set_health', health)

func _on_timer_timeout():
	# 1. create an instance
	var meteor = meteor_scene.instantiate()
	
	# 2. attach instance to level
	$Meteors.add_child(meteor)
	
	# 3. connecting signal 
	meteor.connect('collision', on_meteor_collision)

func on_meteor_collision():
	$Player1.play_damage_sound()
	print('meteor collision on level')
	health -=1
	get_tree().call_group('ui', 'set_health', health)
	if(health < 0):
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_player_1_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos

extends Control

@export var level1: PackedScene = load("res://Scenes/level_1.tscn")

func _ready():
	$CenterContainer/VBoxContainer/ScoreLabel.text = $CenterContainer/VBoxContainer/ScoreLabel.text + str(Global.score)

func _input(event):
	if (event.is_action_pressed("Shoot")):
		get_tree().change_scene_to_packed(level1)

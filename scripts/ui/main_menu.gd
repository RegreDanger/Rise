class_name MainMenu

extends Control

#imports 
@onready var exit_button = $VBoxContainer/MarginContainer/VBoxContainer/ExitButton
@onready var play_button = $VBoxContainer/MarginContainer/VBoxContainer/PlayButton

func _ready() -> void:
	#connect events 
	play_button.connect("pressed",on_play_pressed)
	exit_button.connect("pressed",on_exit_pressed)

func on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/levels/level_one.tscn")

func on_exit_pressed():
	get_tree().quit()

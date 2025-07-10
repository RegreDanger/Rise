class_name MainMenu

extends Control

#scenes 
const LEVEL_ONE_SCENE = preload("res://scenes/maps/level_one.tscn")
const INTRODUCTION_SCENE = preload("res://scenes/introduction/introduction.tscn")

#imports 
@onready var exit_button: Button = $VBoxContainer/MarginContainer/VBoxContainer/ExitButton
@onready var play_button: Button = $VBoxContainer/MarginContainer/VBoxContainer/PlayButton

func _ready() -> void:
	#connect events 
	play_button.connect("pressed",on_play_pressed)
	exit_button.connect("pressed",on_exit_pressed)

func on_play_pressed():
	get_tree().change_scene_to_packed(INTRODUCTION_SCENE)
	#get_tree().change_scene_to_file("res://scenes/maps/level_one.tscn")

func on_exit_pressed():
	get_tree().quit()

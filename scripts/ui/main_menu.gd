class_name MainMenu

extends Control

#managers
@onready var signal_bus_loaded: signal_bus = signal_bus

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
	signal_bus_loaded.emit_signal("request_ui", INTRODUCTION_SCENE)

func on_exit_pressed():
	get_tree().quit()

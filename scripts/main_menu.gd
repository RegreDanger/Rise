class_name MainMenu

extends Control

#imports 
@onready var exit_button = $VBoxContainer/MarginContainer/VBoxContainer/ExitButton

func _ready() -> void:
	print("ESTOY VIVOOOOOOOOOOOOOO!!!")
	
	#connect events 
	exit_button.connect("pressed",on_exit_pressed)


func on_exit_pressed():
	get_tree().quit()

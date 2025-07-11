class_name main_scene extends Control

var main_menu = preload("res://scenes/ui/main_menu.tscn")

func _ready() -> void:
	var firstScene = main_menu.instantiate()
	add_child(firstScene)

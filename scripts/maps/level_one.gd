class_name LevelOne
extends Node2D

#ready 
@onready var planet: Area2D = $Area2D
@onready var options: CanvasLayer = $Options

func _ready() -> void:
	var offset = Vector2(100, 0)
	options.get_node("BuyButton").global_position = planet.get_child(0).global_position + offset 
	
	#connect events 
	planet.connect("body_entered", Callable(self, "handle_options").bind(true))
	planet.connect("body_exited", Callable(self, "handle_options").bind(false))

func handle_options(body: Node, show: bool) -> void:
	if body is Player:
		if show:
			options.show()
		else:
			options.hide()

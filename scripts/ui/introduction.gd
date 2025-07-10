class_name Introduction

extends Node2D

#constans
const dialog = [
	"Este es el comienzo de una aventura...","En esta aventura descubrirás muchas cosas, el espacio es vasto, increíble y lleno de conocimientos.","Lamentablemente para tí.","No todos los conocimientos son buenos."
]

#ready 
@onready var input_manager_loaded: Input_manager = input_manager
@onready var label: Label = $CanvasLayer/Control/PanelContainer/MarginContainer/Label
#vars 
var current_line = 0

func _ready() -> void:
	label.text = dialog[current_line]
	current_line = 1
	
	#events 
	input_manager_loaded.connect("input_action", next_line)
	
func next_line(action: String, toggle: bool):
	if action == "key_space" || "click":
		if toggle && dialog.size() > current_line:
			label.text = dialog[current_line]
			current_line += 1

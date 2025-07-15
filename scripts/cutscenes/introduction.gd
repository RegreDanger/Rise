class_name Introduction extends Node2D

#constans
const dialog = [
	"Este es el comienzo de una aventura...","En esta aventura descubrirás muchas cosas, el espacio es vasto, increíble y lleno de conocimientos.","Lamentablemente para tí.","No todos los conocimientos son buenos."
]

#singletons
@onready var signal_bus_loaded: signal_bus = signal_bus

#ready 
@onready var label: Label = $CanvasLayer/Control/PanelContainer/MarginContainer/Label

#vars 
var current_line: int = 0
var procedural_animations_loaded = procedural_animations.new()

func _ready() -> void:
	add_child(procedural_animations_loaded)
	procedural_animations_loaded.typewritter(5, dialog[current_line], label)
	current_line += 1
	
	#events 
	signal_bus_loaded.connect("input_action", next_line)

func next_line(action: String, toggle: bool):
	if action == "key_space" || "click":
		if toggle && dialog.size() > current_line:
			procedural_animations_loaded.typewritter(5, dialog[current_line], label)
			current_line += 1

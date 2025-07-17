extends Control

#managers
@onready var signal_bus_loaded: signal_bus = signal_bus

#ready
@onready var inventory: Control = $"."

func _ready() -> void:
	#events
	signal_bus_loaded.connect("input_action", _show_inventory)

func _show_inventory(action: String, toggle: bool):
	match action:
		"key_i":
			if toggle:
				if inventory.is_visible_in_tree():
					inventory.hide()
				else:
					inventory.show()

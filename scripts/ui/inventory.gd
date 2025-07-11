class_name Inventory extends Control

#managers
@onready var signal_bus_loaded: signal_bus = signal_bus

#ready
@onready var inventory: Control = $"."
@onready var itemList: ItemList = $HBoxContainer/VBoxContainer2/ItemList

func _ready() -> void:
	#events
	signal_bus_loaded.connect("input_action", _show_inventory)
	add_fake_data()

func _show_inventory(action: String, toggle: bool):
	match action:
		"key_i":
			if toggle:
				if inventory.is_visible_in_tree():
					inventory.hide()
				else:
					inventory.show()

func add_fake_data():
	for i in range(120):
		itemList.add_item(str(i + 1),load("res://assets/sprites/player/SDMS-s.png"))

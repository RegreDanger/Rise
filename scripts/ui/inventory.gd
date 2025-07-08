class_name Inventory extends Control

#readys
@onready var input_manager_loaded: Input_manager = input_manager
@onready var inventory: Control = $"."
@onready var itemList: ItemList = $HBoxContainer/VBoxContainer2/ItemList

func _ready() -> void:
	#events 
	input_manager_loaded.connect("input_action", _show_inventory)
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

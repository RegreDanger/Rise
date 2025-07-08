class_name Inventory

extends Control

#ready 
@onready var itemList = $HBoxContainer/VBoxContainer2/ItemList

func _ready() -> void:
	#var file = FileAccess.open("res://data/user.dat.txt", FileAccess.READ)
	#var content = file.get_as_text()
	
	add_fake_data()

func _process(delta: float) -> void:
	var key_i_pressed: bool = Input.is_action_just_pressed("key_i")
	
	if key_i_pressed: 
		if itemList.is_visible_in_tree():
			itemList.hide()
		else:
			itemList.show()

func add_fake_data():
	itemList.add_item("23",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("13",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("2",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("3",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("22",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("1",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("1",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("1",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("1",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("1",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("1",load("res://assets/sprites/player/SDMS-s.png"))
	itemList.add_item("1",load("res://assets/sprites/player/SDMS-s.png"))
	
	
	
	

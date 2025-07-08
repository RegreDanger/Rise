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
	for i in range(120):
		itemList.add_item(str(i + 1),load("res://assets/sprites/player/SDMS-s.png"))
	
	
	
	

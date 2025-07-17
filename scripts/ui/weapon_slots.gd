extends ItemList

var inventory_data = ["a", "a"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_inventory()

func update_inventory():
	self.clear()
	for item in inventory_data:
		if item != null:
			self.add_item(item)
		else:
			self.add_item("(vacío)")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

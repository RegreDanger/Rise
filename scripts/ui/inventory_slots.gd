extends ItemList

#managers
@onready var signal_bus_loaded: signal_bus = signal_bus

var inventory_data = ["a", "b", "c", "d"]

func _ready() -> void:
	update_inventory_ui()

func _get_drag_data(position):
	var index = self.get_item_at_position(position)
	if index == -1:
		return null
	if [index] == null:
		return null
	var drag_preview = Label.new()
	drag_preview.text = inventory_data[index]
	set_drag_preview(drag_preview)
	return index

func _can_drop_data(position, data):
	self.is_item
	return true

func _drop_data(position, data):
	var from_index = data
	var to_index = self.get_item_at_position(position)
	if to_index == -1 or from_index == to_index:
		return
		
	var temp = inventory_data[to_index]
	inventory_data[to_index] = inventory_data[from_index]
	inventory_data[from_index] = temp
	update_inventory_ui()

func update_inventory_ui():
	self.clear()
	for item in inventory_data:
		if item != null:
			self.add_item(item)
		else:
			self.add_item("(vacío)")

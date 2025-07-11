class_name Input_manager

extends Node

#managers
@onready var signal_bus_loaded: signal_bus = signal_bus

var input_keys: Dictionary = {
	"inventory": "key_i",
	"click": "click",
	"key_space": "key_space"
}

var visible := false

func _process(delta: float) -> void:
	for value in input_keys.values():
		if Input.is_action_just_pressed(value):
			signal_bus_loaded.emit_signal("input_action", value, !visible)

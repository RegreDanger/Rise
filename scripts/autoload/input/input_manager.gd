extends Node

# global signal
signal input_action(action_name: String, is_toggle: bool)

var input_keys := {
	"inventory": "key_i"
}

var visible := false

func _process(delta: float) -> void:
	for value in input_keys.values():
		if Input.is_action_just_pressed(value):
			emit_signal("input_action", value, !visible)

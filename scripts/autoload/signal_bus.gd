extends Node
#This node is for signal management, for connect and emit singals

signal input_action(action_name: String, is_toggle: bool)
signal request_planet(path: String)
signal request_ui(scene: Resource)

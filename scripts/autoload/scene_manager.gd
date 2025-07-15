extends Node

#singletons
@onready var signal_bus_loaded: signal_bus = signal_bus

func _ready() -> void:
	signal_bus_loaded.connect("request_ui", _on_change_ui)
	pass

func _process(delta: float) -> void:
	pass

func _on_change_ui(scene: Resource) -> void:
	get_tree().change_scene_to_packed(scene)

#func _on_change_planet(path: String) -> void:
#	var root = get_tree().root
#	var main = root.get_node("main")
#	var container = main.get_node("planet_container")
#	if main.has_node("planet_container"):
#		for child in container.get_children():
#			child.queue_free()

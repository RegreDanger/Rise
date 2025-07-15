class_name procedural_animations extends Node
var tween_typwritter: Tween = null

func typewritter(time: float, text: String, node: Node) -> void:	
	if "text" in node:
		if tween_typwritter and tween_typwritter.is_valid():
			tween_typwritter.kill()
		node.visible_ratio = 0
		node.text = text
		tween_typwritter = create_tween()
		tween_typwritter.tween_property(node, "visible_ratio", 1.0, time)

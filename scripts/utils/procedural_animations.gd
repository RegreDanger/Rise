class_name procedural_animations extends Node
var tween_typwritter: Tween = null
var tween_rotation: Tween = null

func typewritter(time: float, text: String, node: Node) -> void:	
	if "text" in node:
		if tween_typwritter and tween_typwritter.is_valid():
			tween_typwritter.kill()
		node.visible_ratio = 0
		node.text = text
		tween_typwritter = create_tween()
		tween_typwritter.tween_property(node, "visible_ratio", 1.0, time)

func rotate_to(target_angle: float, sprite: Sprite2D) -> void:
	if tween_rotation and tween_rotation.is_valid():
		tween_rotation.kill()
		
	var current_rot = sprite.rotation
	var target_rot = deg_to_rad(target_angle)
	var shortest_rot = wrapf(target_rot - current_rot, -PI, PI) + current_rot
	
	tween_rotation = create_tween()
	tween_rotation.tween_property(sprite, "rotation", shortest_rot, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

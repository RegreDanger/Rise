class_name Player
extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO
var move_speed_base = 150
var procedural_animations_loaded = procedural_animations.new()

@onready var inventory = preload("res://scenes/ui/inventory.tscn")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var instance_inventory = inventory.instantiate()
	if get_parent().get_node("CanvasLayer") != null:
		get_parent().get_node("CanvasLayer").add_child.call_deferred(instance_inventory)
	add_child(procedural_animations_loaded)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = direction * move_speed_base
	if _set_direction() == true:
		_update_animation()

func _physics_process(delta: float) -> void:
	move_and_slide()

func _set_direction() -> bool:
	var new_dir: Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	match cardinal_direction:
		Vector2.UP:
			procedural_animations_loaded.rotate_to(0, sprite)
		Vector2.DOWN:
			procedural_animations_loaded.rotate_to(180, sprite)
		Vector2.LEFT:
			procedural_animations_loaded.rotate_to(-90, sprite)
		Vector2.RIGHT:
			procedural_animations_loaded.rotate_to(90, sprite)

	return true

func _update_animation() -> void:
	animation_player.play("movement")
	
# func unpack_and_add_weapon() func to connect signal emited from drop of inventory weapon
# here upacks the FSM machine from weapon, adds to the inventory weapon
# instance second node to inventory and the function update inventory fire from _on_index_changed from weapondata.gd

# func update_inventories()
# 	inventrory.update()
# 	inventory2.update()

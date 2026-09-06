class_name Monster
extends Node2D


@onready var polygons: Node2D = $Polygons

var idle_tween : Tween
var dmg_tween : Tween
var atk_tween : Tween
var die_tween : Tween
var pos_x_og 
var scale_y_og 

# possible sequences of actions that the monster can do
var sequences : Array[Sequence] = []

# all monsters have these actions
var attack_action : Action = Action.new(attack)
var wait_action : Action = Action.new(wait)
var block_action : Action = Action.new(block)
var dodge_action : Action = Action.new(dodge)


func _ready() -> void:
	# save original transform properties of sprite
	polygons.modulate = Color(1, 1, 1, 1)
	pos_x_og = polygons.position.x
	scale_y_og = polygons.scale.y
	idle()
	
func take_damage() -> void:
	# anim
	if dmg_tween:
		dmg_tween.kill()
	dmg_tween = create_tween()
	polygons.position.x = pos_x_og
	dmg_tween.tween_property(polygons, 'position', Vector2(pos_x_og + 20, polygons.position.y), 0.2)
	dmg_tween.tween_property(polygons, 'position', Vector2(pos_x_og, polygons.position.y), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)

	
func idle() -> void:
	# anim
	if idle_tween:
		idle_tween.kill()
	idle_tween = create_tween()
	idle_tween.tween_property(polygons, "scale", Vector2(polygons.scale.x, scale_y_og + 0.005), 1.0)
	idle_tween.tween_property(polygons, "scale", Vector2(polygons.scale.x, scale_y_og), 1.0)
	idle_tween.set_loops()
	
func die() -> void:
	# anim
	if idle_tween:
		idle_tween.kill()
	if dmg_tween:
		dmg_tween.kill()
	if atk_tween:
		atk_tween.kill()
	if die_tween: 
		die_tween.kill()
	take_damage()
	dmg_tween.tween_property(polygons, "modulate", Color(1, 1, 1, 0), 0.4)
	
# attack action function
func attack() -> void:
	print('basic attack')
	# anim
	if atk_tween:
		atk_tween.kill()
	atk_tween = create_tween()
	atk_tween.tween_property(polygons, 'position', Vector2(pos_x_og - 20, polygons.position.y), 0.2)
	atk_tween.tween_property(polygons, 'position', Vector2(pos_x_og, polygons.position.y), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	
# wait action function
func wait() -> void:
	print('monster is chilling')
	
# block action function
func block() -> void:
	print('monster is blocking')
	
# dodge action function
func dodge() -> void:
	print('monster is dodging')

func get_random_sequence() -> Sequence:
	return sequences.pick_random()

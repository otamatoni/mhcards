extends Node2D

@export var body_sprite : Sprite2D
@export var arm_sprite : Sprite2D
@export var weap_sprite : Sprite2D
@export var sprites : Node2D

var hp = 100

var idle_tween : Tween
var dmg_tween : Tween
var atk_tween : Tween
var die_tween : Tween
var pos_x_og 
var scale_y_og 

# test basic action
var attack_action : Action = Action.new(attack) 

# temp vars to test player sprites
var armors = ['anja', 'baan', 'bar', 'chain', 'dia', 'gir', 'jagras', 'jyura', 'kiri', 'kulu', 'legi', 'odo', 'pao', 'pukei', 'rath', 'ratha', 'tobi', 'tzi']
var gs = ['anja', 'aqua', 'bar', 'base', 'bone', 'dbone', 'frost', 'gir', 'jag', 'kiri', 'puk', 'rado', 'ratha', 'thunder']
var ig = ['anja', 'aqua', 'base', 'bone', 'dbone', 'dia', 'frost', 'kiri', 'kulu', 'odo', 'puk', 'ratha', 'tobi', 'tzi']
var weapon = gs
var weap_index = 0
var armor_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('player spawned')
	hp = PlayerData.current_hp
	
	# animations
	# save original transform properties of sprite
	sprites.modulate = Color(1, 1, 1, 1)
	pos_x_og = sprites.position.x
	scale_y_og = sprites.scale.y
	idle()
	
	
func take_damage(damage: float) -> void: 
	hp -= damage
	print(hp)
	
	# anim
	if dmg_tween:
		dmg_tween.kill()
	dmg_tween = create_tween()
	sprites.position.x = pos_x_og
	dmg_tween.tween_property(sprites, 'position', Vector2(pos_x_og - 20, sprites.position.y), 0.2)
	dmg_tween.tween_property(sprites, 'position', Vector2(pos_x_og, sprites.position.y), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	
func update_stats() -> void:
	PlayerData.current_hp = hp

func get_actions() -> Array:
	return [attack_action, attack_action, attack_action]
	
func idle() -> void:
	# anim
	if idle_tween:
		idle_tween.kill()
	idle_tween = create_tween()
	idle_tween.tween_property(sprites, "scale", Vector2(sprites.scale.x, scale_y_og + 0.002), 1.0)
	idle_tween.tween_property(sprites, "scale", Vector2(sprites.scale.x, scale_y_og), 1.0)
	idle_tween.set_loops()
			
func attack() -> void:
	# anim
	if atk_tween:
		atk_tween.kill()
	atk_tween = create_tween()
	atk_tween.tween_property(sprites, 'position', Vector2(pos_x_og + 20, sprites.position.y), 0.2)
	atk_tween.tween_property(sprites, 'position', Vector2(pos_x_og, sprites.position.y), 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)



# temp player sprite change 
func change_armor() -> void:
	body_sprite.texture = load('res://Sprites/Player/Armor/Body/%s.png' % armors.get(armor_index))
	arm_sprite.texture = load('res://Sprites/Player/Armor/Arm/%s.png' % armors.get(armor_index))

func change_weapon() -> void:
	if weapon == gs:
		weap_sprite.texture = load("res://Sprites/Player/Weapons/GS/%s.png" % gs.get(weap_index))
	else:
		weap_sprite.texture = load("res://Sprites/Player/Weapons/IG/%s.png" % ig.get(weap_index))


func _on_ig_button_up() -> void:
	weap_index = 0
	weapon = ig
	change_weapon()

func _on_gs_button_up() -> void:
	weap_index = 0
	weapon = gs
	change_weapon()

func _on_armor_next_button_up() -> void:
	if armor_index + 1 >= armors.size():
		armor_index = 0
	else:
		armor_index += 1
	change_armor()

func _on_armor_prev_button_up() -> void:
	if armor_index - 1 < 0:
		armor_index = armors.size() - 1
	else:
		armor_index -= 1
	change_armor()

func _on_weap_next_button_up() -> void:
	if weap_index + 1 >= weapon.size():
		weap_index = 0
	else:
		weap_index += 1
	change_weapon()

func _on_weap_prev_button_up() -> void:
	if weap_index - 1 < 0:
		weap_index = weapon.size() - 1
	else:
		weap_index -= 1
	change_weapon()
	
func _on_idle_button_up() -> void:
	idle()

func _on_attack_button_up() -> void:
	attack()

func _on_owie_button_up() -> void:
	take_damage(1)

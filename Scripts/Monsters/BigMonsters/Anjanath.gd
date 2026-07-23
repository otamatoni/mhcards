extends Node

class_name Anjanath

@export var anim : AnimationPlayer
@export var head : Polygon2D
@export var body : Polygon2D
@export var tail : Polygon2D
@export var frontleg : Polygon2D

var is_head_broken = false




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_head_broken = false
	print('anja appeared')
	anim.play('idle')
	head.texture = preload("res://Sprites/Monsters/BigMonsters/AnjaParts/anja head.png")
	body.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja body.png')
	tail.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja tail.png')
	frontleg.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja frontleg.png')
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_breakhead_button_up() -> void:
	head.texture = preload("res://Sprites/Monsters/BigMonsters/AnjaParts/anja head broken.png")
	is_head_broken = true

func _on_breakbody_button_up() -> void:
	body.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja body broken.png')

func _on_breaktail_button_up() -> void:
	tail.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja tail broken.png')

func _on_breakleg_button_up() -> void:
	frontleg.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja frontleg broken.png')

func _on_attack_button_up() -> void:
	anim.play('attack')

func _on_die_button_up() -> void:
	if is_head_broken == true:
		head.texture = preload("res://Sprites/Monsters/BigMonsters/AnjaParts/anja head broken dead.png")
	else:
		head.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja head dead.png')
	anim.play('die')

func _on_idle_button_up() -> void:
	anim.play('idle')

func _on_owie_button_up() -> void:
	anim.play('hurt')

func _on_reset_button_up() -> void:
	is_head_broken = false
	anim.play('idle')
	head.texture = preload("res://Sprites/Monsters/BigMonsters/AnjaParts/anja head.png")
	body.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja body.png')
	tail.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja tail.png')
	frontleg.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja frontleg.png')

extends BigMonster

class_name Anjanath

@export var head : Sprite2D
@export var body : Sprite2D
@export var tail : Sprite2D
@export var frontleg : Sprite2D

var is_head_broken = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	is_head_broken = false
	print('anja appeared')
	head.texture = preload("res://Sprites/Monsters/BigMonsters/AnjaParts/anja head.png")
	body.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja body.png')
	tail.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja tail.png')
	frontleg.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja frontleg.png')
	polygons.modulate = Color(1,1,1,1)
	

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
	attack()
	pass

func _on_die_button_up() -> void:
	if is_head_broken == true:
		head.texture = preload("res://Sprites/Monsters/BigMonsters/AnjaParts/anja head broken dead.png")
	else:
		head.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja head dead.png')
	die()

func _on_idle_button_up() -> void:
	pass
	
func _on_owie_button_up() -> void:
	take_damage()
	pass

func _on_reset_button_up() -> void:
	idle()
	is_head_broken = false
	polygons.modulate = Color(1,1,1,1)
	pass
	head.texture = preload("res://Sprites/Monsters/BigMonsters/AnjaParts/anja head.png")
	body.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja body.png')
	tail.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja tail.png')
	frontleg.texture = preload('res://Sprites/Monsters/BigMonsters/AnjaParts/anja frontleg.png')

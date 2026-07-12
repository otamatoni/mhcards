extends Node2D

@export var text : Label
@export var monster : Sprite2D
var battle_type : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_battle_type(type: String) -> void:
	battle_type = type
	text.text = 'fight against ' + battle_type + ' monsters!!'
	match battle_type:
		'small':
			fight_small()
		'big':
			fight_big()
		'boss':
			fight_boss()
		
func fight_small() -> void:
	var texture = load("res://Sprites/jagras_small.jpg")
	monster.texture = texture

func fight_big() -> void:
	var texture = load("res://Sprites/rath.png")
	monster.texture = texture
	
func fight_boss() -> void:
	match PlayerData.region:
		0:
			var texture = load("res://Sprites/rathalos.jpg")
			monster.texture = texture
		1:
			var texture = load("res://Sprites/cactus_eater.jpg")
			monster.texture = texture
		2:
			var texture = load("res://Sprites/kirin_mlp.png")
			monster.texture = texture
		3:
			var texture = load("res://Sprites/odo.png")
			monster.texture = texture
		4:
			var texture = load("res://Sprites/zorah.png")
			monster.texture = texture
			
			

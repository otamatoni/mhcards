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
		'elder':
			fight_elder()
		
func fight_small() -> void:
	var texture = load("res://Sprites/jagras_small.jpg")
	monster.texture = texture

func fight_big() -> void:
	var texture = load("res://Sprites/rath.png")
	monster.texture = texture
	
func fight_elder() -> void:
	var texture = load("res://Sprites/nergi_meme.png")
	monster.texture = texture

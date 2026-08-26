extends Node2D

var hp = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('player spawned')
	hp = PlayerData.current_hp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func take_damage(damage: float) -> void: 
	hp -= damage
	
func update_stats() -> void:
	PlayerData.current_hp = hp

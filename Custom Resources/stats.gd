class_name Stats
extends Resource

signal stats_changed

enum blockState {NONE, FULL, HALF}

@export var max_health := 1
@export var art: Texture

var health: int : set = set_health
var block: blockState = blockState.NONE : set = set_block


func set_health(value: int) -> void:
	health = clampi(value, 0, max_health)
	stats_changed.emit()

func set_block(value: blockState) -> void:  
	block = value
	stats_changed.emit()

func take_damage(damage: int) -> void:
	if damage <= 0 or block == blockState.FULL:
		return
	
	if block == blockState.NONE:
		self.health -= damage
	elif block == blockState.HALF:
		self.health = (damage / 2)

func heal(amount: int) -> void:
	self.health += amount

func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = max_health
	instance.block = blockState.NONE
	return instance

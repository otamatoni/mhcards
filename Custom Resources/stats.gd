class_name Stats
extends Resource

signal stats_changed

enum blockState {NONE, FULL, HALF}

@export var max_health := 1
@export var base_armor := 0

var health: int : set = set_health
var block: blockState = blockState.NONE : set = set_block
var armor: int = 0 : set = set_armor
var active_statuses: Array[StatusCondition] = []

func set_health(value: int) -> void:
	health = clampi(value, 0, max_health)
	stats_changed.emit()

func set_block(value: blockState) -> void:  
	block = value
	stats_changed.emit()

func set_armor(value: int) -> void:
	armor = maxi(0, value)
	stats_changed.emit()

func take_damage(damage: int) -> void:
	var mitigated_damage: int = maxi(0, damage - self.armor)
	
	if damage <= 0 or block == blockState.FULL:
		return
	elif block == blockState.NONE:
		self.health -= mitigated_damage
	elif block == blockState.HALF:
		self.health -= (mitigated_damage / 2)

func heal(amount: int) -> void:
	self.health += amount

func get_status(target_name: String) -> StatusCondition:
	for status in active_statuses:
		if status.status_name == target_name:
			return status
	return null

func add_status(new_status: StatusCondition) -> void:
	var existing_status = get_status(new_status.status_name)
	
	if existing_status:
		existing_status.stacks += new_status.stacks
	else:
		active_statuses.append(new_status)

func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = max_health
	instance.block = blockState.NONE
	instance.armor = base_armor
	return instance

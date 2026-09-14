class_name MonsterStats
extends Stats

@export var base_attack : int

func set_attack(value: int) -> void:
	base_attack = maxi(0, value)
	stats_changed.emit()

func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = max_health
	instance.block = blockState.NONE
	instance.armor = base_armor
	instance.base_attack = base_attack
	return instance

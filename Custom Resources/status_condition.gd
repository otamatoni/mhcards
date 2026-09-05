class_name StatusCondition
extends Resource

@export var status_name: String
@export var stacks: int = 1
@export var icon: Texture2D
@export var is_Debuff: bool

func apply_effect(target_stats: Stats) -> void:
	# log: activating status effect
	pass

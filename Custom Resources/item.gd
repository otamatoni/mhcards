class_name Item
extends Resource

@export var item_name: String
@export var icon: Texture2D
@export var description: String

func apply_effect(target_stats: Stats) -> void:
	# log: Item effect triggered
	pass

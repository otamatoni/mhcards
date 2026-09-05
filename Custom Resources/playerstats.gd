class_name PlayerStats
extends Resource

signal stats_changed

@export var max_health: int = 100 : set = set_max_health
@export var main_deck: CardPile
@export var current_health: int = 100 : set = set_current_health
@export var items: Array[Item] = []
@export var gold: int = 0

func set_max_health(value: int) -> void:
	max_health = value
	stats_changed.emit()

func set_current_health(value: int) -> void:
	current_health = value
	stats_changed.emit()

func set_gold(value: int) -> void:
	

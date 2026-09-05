class_name PlayerBattleStats
extends Stats

@export var starting_deck: CardPile
@export var cards_per_turn: int

var deck: CardPile
var discard: CardPile
var draw_pile: CardPile
var combo: int = 0 : set = set_combo
var items: Array[Item] = []

func set_combo(value: int) -> void:
	combo = value
	stats_changed.emit()

func reset_combo() -> void:
	self.combo = 0

func create_instance() -> Resource:
	var instance: PlayerBattleStats = self.duplicate()
	instance.health = max_health
	instance.block = blockState.NONE
	instance.reset_combo()
	instance.deck = instance.starting_deck.duplicate()
	instance.discard = CardPile.new()
	instance.draw_pile = CardPile.new()
	return instance

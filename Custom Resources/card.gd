class_name Card
extends Resource

enum Type {ATTACK, DEFEND, ITEM}
enum Target {SELF, SINGLE_ENEMY, ALL_ENEMIES}

@export_group("Card Attributes")
@export var id: String
@export var type: Type
@export var target: Target


func is_single_targetted() -> bool:
	return target == Target.SINGLE_ENEMY

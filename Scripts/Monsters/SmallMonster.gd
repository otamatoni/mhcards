extends Monster

class_name SmallMonster

func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action]))

extends SmallMonster

class_name Raphinos

func _ready() -> void:
	super()
	sequences.append(Sequence.new([dodge_action]))

	print('raphinos appeared')

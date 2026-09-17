extends SmallMonster

class_name Apceros

func _ready() -> void:
	super()
	sequences.append(Sequence.new([block_action]))
	
	print('apceros appeared')

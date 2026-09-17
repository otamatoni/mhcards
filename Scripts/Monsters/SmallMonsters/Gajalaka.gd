extends SmallMonster

class_name Gajalaka

var bomb_action = Action.new(bomb)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([bomb_action]))
	
	print('gajalaka appeared')

func bomb() -> void:
	print('gaja throws bomb')

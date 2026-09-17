extends SmallMonster

class_name Vespoid

var sting_action = Action.new(sting)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([sting_action]))
	print('vespy appeared')

func sting() -> void: 
	print('vespoid stings')

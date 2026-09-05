extends SmallMonster

class_name Gajau

var dive_action = Action.new(dive)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([dive_action]))
	print('gajau appeared')

func dive() -> void:
	print('gajau dives')

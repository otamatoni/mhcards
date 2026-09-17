extends SmallMonster

class_name Girros

var para_action = Action.new(para)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([para_action]))
	print('girros appeared')

func para() -> void:
	print('girros attacks with paralyzing fangs')

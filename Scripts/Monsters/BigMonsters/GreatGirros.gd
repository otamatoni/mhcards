extends BigMonster

class_name GreatGirros

var para_action = Action.new(para)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([para_action, para_action]))
	sequences.append(Sequence.new([para_action, para_action, para_action]))
	print('great girros appeared')

func para() -> void:
	print('ggirros bites with paralyzing fangs')

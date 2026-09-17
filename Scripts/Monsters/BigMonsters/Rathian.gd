extends BigMonster

class_name Rathian

var poison_tail_action = Action.new(poison_tail)
var fireball_action = Action.new(fireball)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([poison_tail_action]))
	sequences.append(Sequence.new([poison_tail_action, poison_tail_action, dodge_action]))
	sequences.append(Sequence.new([fireball_action, dodge_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	
	print('rathian appeared')

func poison_tail() -> void:
	print('rath poison tail')
	
func fireball() -> void:
	print('rath fireball')

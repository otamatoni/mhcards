extends BigMonster

class_name GreatJagras

var eat_action : Action = Action.new(eat)
var flop_action : Action = Action.new(flop)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action, block_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([eat_action, block_action]))
	sequences.append(Sequence.new([attack_action, attack_action, flop_action]))
	
	print('great jagras appeared')

func eat() -> void:
	print('great jagras consumes and heals')

func flop() -> void:
	print('great jagras belly flops')

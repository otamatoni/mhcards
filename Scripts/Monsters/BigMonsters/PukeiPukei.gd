extends BigMonster

class_name PukeiPukei

var eat_shroom_action = Action.new(eat_shroom)
var spit_poison_action = Action.new(spit_poison)
var charge_tail_action = Action.new(charge_tail)
var tail_release_action = Action.new(tail_release)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action, block_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([eat_shroom_action, block_action]))
	sequences.append(Sequence.new([charge_tail_action, wait_action, tail_release_action]))
	sequences.append(Sequence.new([spit_poison_action]))
	
	print('pukei appeared')

func eat_shroom() -> void:
	print('pukei eats shroom')
	
func spit_poison() -> void:
	print('pukei spits poison')
	
func charge_tail() -> void:
	print('pukei charges tail')
	
func tail_release() -> void:
	print('pukei spews poison outta tail')
	

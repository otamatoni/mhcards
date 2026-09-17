extends BigMonster

class_name Diablos

var dig_action = Action.new(dig)
var jump_action = Action.new(jump)
var charge_action = Action.new(charge)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([dig_action, wait_action, jump_action]))
	sequences.append(Sequence.new([charge_action, charge_action, charge_action]))
	sequences.append(Sequence.new([block_action, block_action]))
	
	print('diablos appeared')

func dig() -> void:
	print('diablos digs')
	
func jump() -> void:
	print('diablos emerges')
	
func charge() -> void:
	print('diablos charges at you')

extends BigMonster

class_name Diablos

var dig_action = Action.new(dig)
var jump_action = Action.new(jump)
var underground_action = Action.new(underground, BattleVariables.untargetable)
var ready_charge_action = Action.new(ready_charge)
var charge_action = Action.new(charge)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([dig_action, underground_action, jump_action]))
	sequences.append(Sequence.new([ready_charge_action]))
	sequences.append(Sequence.new([charge_action, charge_action, charge_action]))
	
	print('diablos appeared')

func dig() -> void:
	print('diablos digs')
	
func jump() -> void:
	print('diablos emerges')
	
func underground() -> void:
	print('diablos is underground')
	
func ready_charge() -> void:
	print('diablos paws at the ground')
	
func charge() -> void:
	print('diablos charges at you')

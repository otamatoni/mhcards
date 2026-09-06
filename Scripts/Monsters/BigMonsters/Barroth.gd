extends BigMonster

class_name Barroth

var charge_action = Action.new(charge)
var shake_action = Action.new(shake)
var eat_action = Action.new(eat)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([charge_action, charge_action]))
	sequences.append(Sequence.new([shake_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([eat_action]))
	
	print('barroth appeared')
	
func charge() -> void:
	print('barroth charges at you')
	
func shake() -> void:
	print('barroth shakes off mud')
	
func eat() -> void:
	print('barroth eats ants')

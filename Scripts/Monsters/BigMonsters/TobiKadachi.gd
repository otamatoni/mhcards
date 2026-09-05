extends BigMonster

class_name TobiKadachi

var charge_tail_action = Action.new(charge_tail)
var tail_attack_action = Action.new(tail_attack)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([charge_tail_action]))
	sequences.append(Sequence.new([tail_attack_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	
	print('tobi appeared')

func charge_tail() -> void:
	print('tobi charges tail')
	
func tail_attack() -> void:
	print('tobi releases tail electricity')

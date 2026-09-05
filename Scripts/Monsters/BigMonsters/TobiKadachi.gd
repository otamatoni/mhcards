extends BigMonster

class_name TobiKadachi

var charge_tail_action = Action.new(charge_tail)
var release_tail_action = Action.new(release_tail)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([charge_tail_action]))
	sequences.append(Sequence.new([release_tail_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	
	print('tobi appeared')

func charge_tail() -> void:
	print('tobi charges tail')
	
func release_tail() -> void:
	print('tobi releases tail electricity')

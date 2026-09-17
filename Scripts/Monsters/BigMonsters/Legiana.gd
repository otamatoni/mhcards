extends BigMonster

class_name Legiana

var ice_wing_action = Action.new(ice_wing)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([ice_wing_action, dodge_action]))
	sequences.append(Sequence.new([ice_wing_action, ice_wing_action]))
	sequences.append(Sequence.new([dodge_action, dodge_action]))
	
	
	print('legiana appeared')
	
func ice_wing() -> void:
	print('legiana ice wings')

extends BigMonster

class_name Legiana

var wing_action = Action.new(wing)
var ice_wing_action = Action.new(ice_wing)
var claw_action = Action.new(claw)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([wing_action, claw_action, claw_action]))
	sequences.append(Sequence.new([ice_wing_action]))
	
	print('legiana appeared')

func wing() -> void:
	print('legiana flaps its wings')
	
func claw() -> void:
	print('legiana claws')
	
func ice_wing() -> void:
	print('legiana ice wings')

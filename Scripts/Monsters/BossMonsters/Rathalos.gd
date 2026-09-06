extends BigMonster

class_name Rathalos

var fireball_action = Action.new(fireball)
var wing_action = Action.new(wing)
var poison_claw_action = Action.new(poison_claw)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([wing_action, poison_claw_action, poison_claw_action]))
	sequences.append(Sequence.new([fireball_action]))
	sequences.append(Sequence.new([fireball_action, fireball_action]))
	sequences.append(Sequence.new([fireball_action, fireball_action, fireball_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([hip_check_action]))
	
	
	print('rathalos appeared')

func fireball() -> void:
	print('fireball')
	
func wing() -> void:
	print('rathalos flaps wings')
	
func poison_claw() -> void:
	print('rathalos claws with poison')

extends BigMonster

class_name Odogaron

var claw_action = Action.new(claw)
var eat_action = Action.new(eat)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([claw_action, claw_action]))
	sequences.append(Sequence.new([claw_action, claw_action, claw_action]))
	sequences.append(Sequence.new([eat_action]))

	print('clifford appeared')

func claw() -> void:
	print('odo slashes with bleed claws')
	
func eat() -> void:
	print('odo eats some meat')

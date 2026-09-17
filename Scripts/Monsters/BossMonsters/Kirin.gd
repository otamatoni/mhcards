extends BigMonster

class_name Kirin

var charge_action = Action.new(charge)
var lightning_action = Action.new(lightning)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([charge_action, charge_action]))
	sequences.append(Sequence.new([charge_action, charge_action, charge_action]))
	sequences.append(Sequence.new([lightning_action, lightning_action]))
	sequences.append(Sequence.new([lightning_action, lightning_action, lightning_action]))
	
	print('kirin appeared')

func charge() -> void:
	print('kirin charges at you')

func lightning() -> void:
	print('kirin summons lightning')

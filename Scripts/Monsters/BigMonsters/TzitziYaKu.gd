extends BigMonster

class_name TzitziYaKu

var charge_flash_action = Action.new(charge_flash)
var flash_action = Action.new(flash)
var jump_action = Action.new(jump)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([charge_flash_action, flash_action, jump_action]))
	sequences.append(Sequence.new([hip_check_action]))
	sequences.append(Sequence.new([dodge_action, dodge_action]))
	
	print('tzitzi appeared')

func charge_flash() -> void:
	print('tzitzi charges its flash')
	
func flash() -> void:
	print('tzitzi flashes')
	
func jump() -> void:
	print('tzitzi jumps on you')

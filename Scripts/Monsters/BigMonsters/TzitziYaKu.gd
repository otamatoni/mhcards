extends BigMonster

class_name TzitziYaKu

var charge_flash_action = Action.new(charge_flash)
var flash_action = Action.new(flash)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sequences.append(Sequence.new([charge_flash_action, flash_action]))
	sequences.append(Sequence.new([hip_check_action]))
	
	print('tzitzi appeared')

func charge_flash() -> void:
	print('tzitzi charges its flash')
	
func flash() -> void:
	print('tzitzi flashes')

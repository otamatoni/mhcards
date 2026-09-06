extends BigMonster

class_name Paolumu

var sleep_gas_action = Action.new(sleep_gas)
var body_slam_action = Action.new(body_slam)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action]))
	sequences.append(Sequence.new([attack_action, attack_action, attack_action]))
	sequences.append(Sequence.new([sleep_gas_action]))
	sequences.append(Sequence.new([body_slam_action]))
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	
	print('paolumu appeared')
	
func sleep_gas() -> void:
	print('paolumu releases sleep gas')
	
func body_slam() -> void:
	print('paolumu body slams the ground')

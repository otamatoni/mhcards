extends BigMonster

class_name Radobaan

var sleep_gas_action = Action.new(sleep_gas)
var ball_action = Action.new(ball)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([roar_action, attack_action, attack_action]))
	sequences.append(Sequence.new([ball_action]))
	sequences.append(Sequence.new([sleep_gas_action]))
	
	print('radobaan appeared')

func sleep_gas() -> void:
	print('rado releases sleep gas')
	
func ball() -> void:
	print('rado beyblades you')

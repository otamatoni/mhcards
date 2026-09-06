extends BigMonster

class_name KuluYaKu

var rock_action = Action.new(rock)
var rock_throw_action = Action.new(rock_throw)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sequences.append(Sequence.new([rock_action]))
	sequences.append(Sequence.new([rock_throw_action]))
	sequences.append(Sequence.new([hip_check_action]))
	print('kulu appeared')

func rock() -> void:
	print('kulu picks up rock')
	
func rock_throw() -> void:
	print('kulu throws rock')

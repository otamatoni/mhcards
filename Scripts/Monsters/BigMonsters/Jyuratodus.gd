extends BigMonster

class_name Jyuratodus

var dive_action = Action.new(dive)
var jump_action = Action.new(jump)
var water_spit_action = Action.new(water_spit)
var underwater_action = Action.new(underwater, BattleVariables.untargetable)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([dive_action, underwater_action, jump_action]))
	sequences.append(Sequence.new([water_spit_action]))
	sequences.append(Sequence.new([water_spit_action, water_spit_action]))
	sequences.append(Sequence.new([water_spit_action, water_spit_action, water_spit_action]))
	sequences.append(Sequence.new([hip_check_action]))
	
	print('jyura appeared')

func dive() -> void:
	print('jyura dive')
	
func jump() -> void:
	print('jyura jump')

func water_spit() -> void:
	print('jyura spits water')
	
func underwater() -> void:
	print('jyura is underwater')

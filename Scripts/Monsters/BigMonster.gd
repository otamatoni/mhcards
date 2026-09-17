extends Monster

class_name BigMonster

var roar_action : Action = Action.new(roar, BattleVariables.concurrent_stun)
var hip_check_action : Action = Action.new(hip_check)
	
# some big monsters can roar which stuns same turn
func roar() -> void:
	print('monster roars')
	
# some big monsters can hip check which stuns next turn
func hip_check() -> void:
	print('hip check')

class_name Action

var priority_label : String
var action : Callable # the actual function 

func _init(act : Callable, label : String = BattleVariables.normal) -> void:
	action = act

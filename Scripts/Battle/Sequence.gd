class_name Sequence 

var actions : Array[Action] = []
var icon : Sprite2D

func _init(acts : Array[Action]) -> void:
	actions = acts
	
func get_actions() -> Array[Action]:
	return actions.duplicate(true)

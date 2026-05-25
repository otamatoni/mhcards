extends Control

@export var option1 : Button
@export var option2 : Button
@export var option3 : Button

var options = ['food attack up', 'food defense up', 'food element up', 'food add new skill', '+1 revive']

func _ready() -> void:
	var options_cpy = options.duplicate()
	options_cpy.shuffle()
	var opt1 = options_cpy.pop_back()
	var opt2 = options_cpy.pop_back()
	var opt3 = options_cpy.pop_back()
	
	option1.text = opt1
	option2.text = opt2
	option3.text = opt3

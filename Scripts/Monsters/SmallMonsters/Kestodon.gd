extends SmallMonster

class_name Kestodon

var headbutt_action = Action.new(headbutt)

func _ready() -> void:
	super()
	sequences.append(Sequence.new([headbutt_action]))
	print('kestodon appeared')

func headbutt() -> void:
	print('kesto headbutts')

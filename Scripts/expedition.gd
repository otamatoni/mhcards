extends Control

@export var description : Label
enum encounter_pool {TP_CAMP, TP_PREV, GET_HERB, GET_BUG, GET_ROCK, VESPY, CAT_STEAL}
var selected : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected = randi() % encounter_pool.size()
	match selected:
		encounter_pool.TP_CAMP:
			tp_camp()
		encounter_pool.TP_PREV:
			tp_prev()
		encounter_pool.GET_HERB:
			get_herb()
		encounter_pool.GET_BUG:
			get_bug()
		encounter_pool.GET_ROCK:
			get_rock()
		encounter_pool.VESPY:
			vespy()
		encounter_pool.CAT_STEAL:
			cat_steal()

func tp_camp() -> void:
	description.text = 'you got lost, go back to nearest camp'

func tp_prev() -> void:
	description.text = 'you got lost, gotta backtrack'

func get_herb() -> void:
	description.text = 'collected 5 herbs'
	
func get_bug() -> void:
	description.text = 'collected 3 bitterbugs'

func get_rock() -> void:
	description.text = 'collected 2 dragonite'

func vespy() -> void:
	description.text = 'get stung by vespoid lol'

func cat_steal() -> void:
	description.text = 'cat stole ur potion'

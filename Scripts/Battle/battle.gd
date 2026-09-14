extends Node2D

<<<<<<< Updated upstream
=======
@export var action_timer : Timer
@export var monsters : Node2D
@export var end_phase_button : Button
@export var player : Node2D
@export var campaign_stats : PlayerStats
@export var player_stats : PlayerBattleStats

>>>>>>> Stashed changes
var battle_type : String

var forest_mons = [GreatJagras, KuluYaKu, PukeiPukei, TobiKadachi, Anjanath, Rathian]
var wildspire_mons = [Barroth, Jyuratodus, KuluYaKu, Anjanath, Rathian]
var coral_mons = [Legiana, Paolumu, TzitziYaKu]
var vale_mons = [GreatGirros, Radobaan]

var forest_small = [Jagras, Gajau, Gajalaka, Vespoid]
var wildspire_small = [Kestodon, Apceros, Gajalaka, Vespoid]
var coral_small = [Shamos, Raphinos, Gajalaka, Vespoid]
var vale_small = [Girros, Hornetaur, Gajalaka, Vespoid]

<<<<<<< Updated upstream
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
=======
func _ready() -> void:
	var battle_stats = player_stats.create_instance()
	
	battle_stats.max_health = campaign_stats.max_health
	battle_stats.health = campaign_stats.current_health
	
	player.stats = battle_stats
>>>>>>> Stashed changes

func set_battle_type(type: String) -> void:
	battle_type = type
	match battle_type:
		'small':
			fight_small()
		'big':
			fight_big()
		'boss':
			fight_boss()
		
func fight_small() -> void:
	# picks random small monster from the region
	var monster_class = 'Placeholder'
	match PlayerData.region:
		0:
			monster_class = forest_small.pick_random().get_global_name()
		1:
			monster_class = wildspire_small.pick_random().get_global_name()
		2:
			monster_class = coral_small.pick_random().get_global_name()
		3:
			monster_class = vale_small.pick_random().get_global_name()

	var path_name = PathReferences.small_monster_dir + monster_class + '.tscn'
	var monster_scene = load(path_name).instantiate()
	add_child(monster_scene)

func fight_big() -> void:
	# spawns random big monster from the region
	var monster_class = 'Placeholder'
	match PlayerData.region:
		0:
			monster_class = forest_mons.pick_random().get_global_name()
		1:
			monster_class = wildspire_mons.pick_random().get_global_name()
		2:
			monster_class = coral_mons.pick_random().get_global_name()
		3:
			monster_class = vale_mons.pick_random().get_global_name()

	var path_name = PathReferences.big_monster_dir + monster_class + '.tscn'
	var monster_scene = load(path_name).instantiate()
<<<<<<< Updated upstream
	add_child(monster_scene)
		
=======
	monster_scene.stats = monster_scene.base_stats.create_instance()
	monsters.add_child(monster_scene)
	monster_hand = monster_scene.get_random_sequence().get_actions()
>>>>>>> Stashed changes
	
func fight_boss() -> void:
	# spawns specific boss monster for the region
	var monster_class = null
	match PlayerData.region:
		0:
			monster_class = 'Rathalos'
		1:
			monster_class = 'Diablos'
		2:
			monster_class = 'Kirin'
		3:
			monster_class = 'Odogaron'
		4:
			monster_class = 'Zorah'
			
	var path_name = PathReferences.boss_monster_dir + monster_class + '.tscn'
	var monster_scene = load(path_name).instantiate()
	add_child(monster_scene)
			
			

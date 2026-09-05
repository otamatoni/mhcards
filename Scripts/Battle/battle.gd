extends Node2D

@export var action_timer : Timer
@export var monsters : Node2D
@export var end_phase_button : Button
@export var player : Node2D

var battle_type : String
var monster_class 

# the hands that will actually be played on the current turn
var player_hand = []
var monster_hand = []

# for when monster hand is not full
var do_nothing_action = Action.new(do_nothing)

var forest_mons = [GreatJagras, KuluYaKu, PukeiPukei, TobiKadachi, Anjanath, Rathian]
var wildspire_mons = [Barroth, Jyuratodus, KuluYaKu, Anjanath, Rathian]
var coral_mons = [Legiana, Paolumu, TzitziYaKu]
var vale_mons = [GreatGirros, Radobaan]

var forest_small = [Jagras, Gajau, Gajalaka, Vespoid]
var wildspire_small = [Kestodon, Apceros, Gajalaka, Vespoid]
var coral_small = [Shamos, Raphinos, Gajalaka, Vespoid]
var vale_small = [Girros, Hornetaur, Gajalaka, Vespoid]

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
	monster_class = 'Jagras'
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
	var quantity = randi() % 3
	var monster_scene
	for i in range(quantity + 1):
		monster_scene = load(path_name).instantiate()
		monsters.add_child(monster_scene)
		monster_scene.position.x += 150 * i
		for action in monster_scene.get_random_sequence().get_actions():
			if monster_hand.size() > 3: 
				break
			monster_hand.append(action)

func fight_big() -> void:
	# spawns random big monster from the region
	monster_class = 'Anjanath'
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
	monsters.add_child(monster_scene)
	monster_hand = monster_scene.get_random_sequence().get_actions()
	
func fight_boss() -> void:
	# spawns specific boss monster for the region
	monster_class = 'Rathalos'
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
	monsters.add_child(monster_scene)
	monster_hand = monster_scene.get_random_sequence().get_actions()

# battle manager gets hands from both player and monster and executes accordingly
func _on_end_phase_button_up() -> void:
	end_phase_button.visible = false
	player_hand = player.get_actions().duplicate(true)
	var monster_action_index
	var player_action_index
	
	# execution phase
	for i in range(3):
		# delay between each action
		action_timer.start()
		await action_timer.timeout
		
		# check if the current action is empty
		if monster_hand.size() >= i:
			monster_action_index = 999
			monster_hand.append(do_nothing_action)
		else:
			monster_action_index = BattleVariables.priority_list.find(monster_hand[i].priority_label)
		if player_hand.size() >= i:
			player_action_index = 999
			player_hand.append(do_nothing_action)
		else:
			player_action_index = BattleVariables.priority_list.find(player_hand[i].priority_label)
			
		# compare and execute the actions in order
		if monster_action_index < player_action_index:
			monster_hand[i].action.call()
			action_timer.start()
			await action_timer.timeout
			player_hand[i].action.call()
		else:
			player_hand[i].action.call()
			action_timer.start()
			await action_timer.timeout
			monster_hand[i].action.call()
			
	monster_hand.clear()
	
	# add new actions into the monster hand
	for monster in monsters.get_children():
		for action in monster.get_random_sequence().get_actions():
			if monster_hand.size() > 3: 
				break
			monster_hand.append(action)
		for sequence in monster.sequences:
			print(sequence.get_actions())

	# back to player phase
	end_phase_button.visible = true

	
func do_nothing() -> void:
	pass

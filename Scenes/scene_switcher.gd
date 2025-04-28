extends Node

@export var num_node_types = 8 
@export var max_trials = 2
@export var num_starting_nodes = 2
@onready var current_scene = $Map

# needed for Map scene
@export var num_layers = 7 # height
@export var nodes_per_layer = 5 # width
var map = []
var paths = {}
var map_gui_positions = []

func _ready() -> void:
	generate_map()
	load_map()
	
# handles when a node is pressed
func handle_node_is_up(node_id) -> void:
	print('scene switcher got node_is_up with node id ', node_id)
	var next_scene = preload("res://Scenes/battle.tscn").instantiate()
	add_child(next_scene)
	var win_button = next_scene.get_node("CanvasLayer/Win")
	win_button.button_up.connect(handle_won)
	current_scene.queue_free()
	current_scene = next_scene

# loads back map when won
func handle_won() -> void:
	load_map()
	
# logic for generating initial map
func generate_map() -> void:
	# generate grid
	var row
	for i in range(num_layers):
		row = []
		for j in range(nodes_per_layer):
			row.append([randi() % num_node_types, 0])
		map.append(row)
	
	# generate starting nodes
	var temp = []
	var starting_nodes = []
	var index
	for i in range(nodes_per_layer):
		temp.append([0, i])
	for i in range(num_starting_nodes):
		index = randi() % temp.size()
		starting_nodes.append(temp.pop_at(index))
	starting_nodes.sort()
	for s in starting_nodes:
		map[s[0]][s[1]][1] = 1
	
	
	# start pathing
	var frontier = []
	var current_node 
	var current_node_str
	var possible_nodes = []
	var greatest_taken_col = -1
	var adjacent_node
	var random_connection
	var current_layer = 0
	frontier.append_array(starting_nodes)
	
	# reverse BFS somewhat
	while not frontier.is_empty():
		possible_nodes.clear()
		current_node = frontier.pop_front()
		current_node_str = var_to_str(current_node)
		paths[current_node_str] = []
		
		# reset overlap check when move to new layer
		if current_node[0] != current_layer:
			greatest_taken_col = -1
			current_layer = current_node[0]
		
		# get all possible nodes
		for i in range(-1, 2):
			adjacent_node = [current_node[0]+1, current_node[1]+i]
			if adjacent_node[1] >= 0 and adjacent_node[1] < nodes_per_layer and adjacent_node[1] >= greatest_taken_col:
				possible_nodes.append(adjacent_node)
		
		# randomly choose connections
		for i in range(max_trials):
			random_connection = possible_nodes.pick_random()
			if not paths[current_node_str].has(random_connection):
				paths[current_node_str].append(random_connection)
				map[random_connection[0]][random_connection[1]][1] = 1
				# to prevent overlapping
				if random_connection[1] > greatest_taken_col:
					greatest_taken_col = random_connection[1]
		
		# add to frontier
		paths[current_node_str].sort()
		if current_node[0]+2 < num_layers:
			for node in paths[current_node_str]:
				if not frontier.has(node):
					frontier.append(node)
	
# loap map into scene
func load_map() -> void:
	# pre load scene
	var next_scene = preload("res://Scenes/map.tscn").instantiate()
	
	# transfer params
	next_scene.nodes_per_layer = nodes_per_layer
	next_scene.num_layers = num_layers
	next_scene.map = map
	next_scene.paths = paths
	next_scene.map_gui_positions = map_gui_positions
	
	# add child to SceneSwitcher
	add_child(next_scene)
	current_scene.queue_free()
	current_scene = next_scene
	current_scene.connect('node_is_up', handle_node_is_up)
	
	

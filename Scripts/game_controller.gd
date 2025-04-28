extends Node2D

@export var nodes_per_layer = 5 # width
@export var num_layers = 7 # height
@export var num_node_types = 8 
@export var max_trials = 2
@export var num_starting_nodes = 2
var map = []
var paths = {}
var map_gui_positions = []
var square_size = 30

func _ready() -> void:
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
	
	print('full map: %s' % var_to_str(map))
	print('starting nodes: %s' % var_to_str(starting_nodes))
	
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
					
			
	print("paths: %s" % var_to_str(paths))
	print('selected map: %s' % var_to_str(map))
	
	
	# draw on gui
	for i in range(num_layers):
		row = []
		row.resize(nodes_per_layer)
		row.fill(Vector2(0, 0))
		map_gui_positions.append(row)
	

	var disabled_color = StyleBoxFlat.new()
	disabled_color.bg_color = Color(0.5, 0.5, 0.5)
	var normal_color = StyleBoxFlat.new()
	normal_color.bg_color = Color(1, 1, 1)
	var hover_color = StyleBoxFlat.new()
	hover_color.bg_color = Color(0, 1, 0)
	var pressed_color = StyleBoxFlat.new()
	pressed_color.bg_color = Color(1, 1, 0)

	for y in range(num_layers):
		for x in range(nodes_per_layer):
			if map[y][x][1] == 1:
				var node = Button.new()
				
				node.add_theme_stylebox_override('disabled', disabled_color)
				node.add_theme_stylebox_override('normal', normal_color)
				node.add_theme_stylebox_override('hover', hover_color)
				node.add_theme_stylebox_override('pressed', pressed_color)
				node.button_up.connect(node_up)

				
				node.size = Vector2(square_size, square_size)
				node.disabled = false
				node.focus_mode = Control.FOCUS_NONE
				add_child(node)
				node.position = Vector2((x+2) * square_size*2, (y+1) * square_size*2) 
				map_gui_positions[y][x] = node.position
		
	

func _draw() -> void:
	var pos_from
	for pos_from_str in paths.keys():
		pos_from = JSON.parse_string(pos_from_str)
		pos_from = map_gui_positions[pos_from[0]][pos_from[1]]
		pos_from[0] += square_size / 2
		pos_from[1] += square_size / 2
		for pos_to in paths[pos_from_str]:
			pos_to = map_gui_positions[pos_to[0]][pos_to[1]]
			pos_to[0] += square_size / 2
			pos_to[1] += square_size / 2
			draw_line(pos_from, pos_to, Color(1, 1, 1), 2)
			print('from %s to %s' % [pos_from, pos_to])
			
func node_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/battle.tscn")

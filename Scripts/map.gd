extends Control

@export var region_label : Label

var nodes_per_layer # width
var num_layers # height
var map = [] # 0 = no node, 1 = valid node, 2 = past node, 3 = selectable node, 4 = past selected node; SHUD MAKE ENUM
var paths = {}
var map_gui_positions = []

var square_size = 30
signal node_is_up(node_id, node_position)

# draws map with params from SceneSwitcher
func _ready() -> void:
	# change text and map dimensions based on region
	match PlayerData.region:
		0:
			region_label.text = 'ancient forest'
			nodes_per_layer = MapVariables.forest_nodes_per_layer
			num_layers = MapVariables.forest_num_layers
		1:
			region_label.text = 'wildspire wastes'
			nodes_per_layer = MapVariables.wildspire_nodes_per_layer
			num_layers = MapVariables.wildspire_num_layers
		2:
			region_label.text = 'coral highlands'
			nodes_per_layer = MapVariables.coral_nodes_per_layer
			num_layers = MapVariables.coral_num_layers
		3: 
			region_label.text = 'rotten vale'
			nodes_per_layer = MapVariables.vale_nodes_per_layer
			num_layers = MapVariables.vale_num_layers
		4:
			region_label.text = 'everstream'
			nodes_per_layer = MapVariables.everstream_nodes_per_layer
			num_layers = MapVariables.everstream_num_layers
	
	# initialize map_gui_positions 
	var row
	for i in range(num_layers):
		row = []
		row.resize(nodes_per_layer)
		row.fill(Vector2(0, 0))
		map_gui_positions.append(row)
	
	# styles for buttons
	var future_node_color = StyleBoxFlat.new()
	future_node_color.bg_color = Color(0, 0, 0)
	var previous_selected_color = StyleBoxFlat.new()
	previous_selected_color.bg_color = Color(0.5, 0.5, 0)
	var clickable_color = StyleBoxFlat.new()
	clickable_color.bg_color = Color(1, 0.5, 0)
	var past_node_color = StyleBoxFlat.new()
	past_node_color.bg_color = Color(0.5, 0.5, 0.5)
	
	var hover_color = StyleBoxFlat.new()
	hover_color.bg_color = Color(1, 0.75, 0)
	var pressed_color = StyleBoxFlat.new()
	pressed_color.bg_color = Color(1, 0.5, 0.25)

	# draw nodes as buttons
	for y in range(num_layers):
		for x in range(nodes_per_layer):
			if map[y][x][1] != MapVariables.map_states.NO_NODE:
				var node = Button.new()
				
				# button functionality
				node.button_up.connect(node_up.bind(map[y][x][0], [y, x]))
				node.size = Vector2(square_size, square_size)
				node.focus_mode = Control.FOCUS_NONE
				node.text = var_to_str(map[y][x][0])
				
				# button styles
				node.add_theme_stylebox_override('disabled', future_node_color)
				node.add_theme_stylebox_override('normal', clickable_color)
				node.add_theme_stylebox_override('hover', hover_color)
				node.add_theme_stylebox_override('pressed', pressed_color)
				# only the font_color works atm
				node.add_theme_color_override('font_color_disabled', Color(0, 0, 1))
				node.add_theme_color_override('font_color', Color(0, 0, 1))
				node.add_theme_color_override('font_color_hover', Color(0, 0, 1))
				node.add_theme_color_override('font_color_pressed', Color(0, 0, 1))
				
				# node selectability logic
				node.disabled = true
				if map[y][x][1] == MapVariables.map_states.PAST_NODE:
					node.add_theme_stylebox_override('disabled', past_node_color)
				elif map[y][x][1] == MapVariables.map_states.SELECTABLE_NODE:
					node.disabled = false
				elif map[y][x][1] == MapVariables.map_states.PAST_SELECTED_NODE:
					node.add_theme_stylebox_override('disabled', previous_selected_color)
				
				add_child(node)
				
				# special properties for boss node
				if y+1 == num_layers:
					node.size = Vector2(square_size + 32, square_size)
					var boss_x = (((nodes_per_layer+1) * square_size*2)+(4 * square_size))/2
					node.position = Vector2(boss_x, (num_layers+1) * square_size*2) 
				else:
					node.position = Vector2((x+2) * square_size*2, (y+1) * square_size*2) 
				map_gui_positions[y][x] = node.position
		
	

func _draw() -> void:
	# draw connections
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
			
# each node/button emits signal when pressed
func node_up(node_id, node_position) -> void:
	emit_signal("node_is_up", node_id, node_position)
	

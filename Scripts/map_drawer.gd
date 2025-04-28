extends Control

var nodes_per_layer = 5 # width
var num_layers = 7 # height
var map = []
var paths = {}
var map_gui_positions = []

var square_size = 30
signal node_is_up(node_id)

# draws map with params from SceneSwitcher
func _ready() -> void:
	var row
	
	# draw on gui
	for i in range(num_layers):
		row = []
		row.resize(nodes_per_layer)
		row.fill(Vector2(0, 0))
		map_gui_positions.append(row)
	
	# styles for buttons
	var disabled_color = StyleBoxFlat.new()
	disabled_color.bg_color = Color(0.5, 0.5, 0.5)
	var normal_color = StyleBoxFlat.new()
	normal_color.bg_color = Color(1, 1, 1)
	var hover_color = StyleBoxFlat.new()
	hover_color.bg_color = Color(0, 1, 0)
	var pressed_color = StyleBoxFlat.new()
	pressed_color.bg_color = Color(1, 1, 0)

	# draw nodes as buttons
	for y in range(num_layers):
		for x in range(nodes_per_layer):
			if map[y][x][1] == 1:
				var node = Button.new()
				
				node.add_theme_stylebox_override('disabled', disabled_color)
				node.add_theme_stylebox_override('normal', normal_color)
				node.add_theme_stylebox_override('hover', hover_color)
				node.add_theme_stylebox_override('pressed', pressed_color)
				node.button_up.connect(node_up.bind(map[y][x][0]))
				node.size = Vector2(square_size, square_size)
				node.disabled = false
				node.focus_mode = Control.FOCUS_NONE
				node.text = var_to_str(map[y][x][0])
				# only the font_color works atm
				node.add_theme_color_override('font_color_disabled', Color(0, 0, 1))
				node.add_theme_color_override('font_color', Color(0, 0, 1))
				node.add_theme_color_override('font_color_hover', Color(0, 0, 1))
				node.add_theme_color_override('font_color_pressed', Color(0, 0, 1))
				
				add_child(node)
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
func node_up(node_id) -> void:
	emit_signal("node_is_up", node_id)
	

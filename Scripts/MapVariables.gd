class_name MapVariables

# forest map dim
const forest_nodes_per_layer = 6 # width
const forest_num_layers = 7 # height
const forest_num_starting_nodes = 3

# wildspire map dim
const wildspire_nodes_per_layer = 6 # width
const wildspire_num_layers = 6 # height
const wildspire_num_starting_nodes = 3

# coral map dim
const coral_nodes_per_layer = 5 # width
const coral_num_layers = 6 # height
const coral_num_starting_nodes = 3

# vale map dim
const vale_nodes_per_layer = 5 # width
const vale_num_layers = 6 # height
const vale_num_starting_nodes = 3

# everstream map dim
const everstream_nodes_per_layer = 4 # width
const everstream_num_layers = 3 # height
const everstream_num_starting_nodes = 2

# 0 = no node, 1 = valid node, 2 = past node, 3 = selectable node, 4 = past selected node
enum map_states {
	NO_NODE,
	VALID_NODE,
	PAST_NODE,
	SELECTABLE_NODE,
	PAST_SELECTED_NODE
}

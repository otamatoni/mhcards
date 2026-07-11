class_name MapVariables

const nodes_per_layer = 5 # width
const num_layers = 7 # height

# 0 = no node, 1 = valid node, 2 = past node, 3 = selectable node, 4 = past selected node
enum map_states {
	NO_NODE,
	VALID_NODE,
	PAST_NODE,
	SELECTABLE_NODE,
	PAST_SELECTED_NODE
}

extends CardState

func enter() -> void:
	card_ui.color.color = Color.DARK_ORCHID
	card_ui.state.text = "RELEASED"

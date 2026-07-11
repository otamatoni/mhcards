extends Button

func _on_button_up() -> void:
	get_tree().change_scene_to_file(PathReferences.deck_select_scene)

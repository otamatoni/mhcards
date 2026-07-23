extends Button

func _on_button_up() -> void:
	PlayerData.region = 0
	get_tree().change_scene_to_file(PathReferences.game_over_scene)

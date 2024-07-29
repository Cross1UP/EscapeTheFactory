extends Area2D


func _on_NextLevel_body_entered(body):
	if body.is_in_group("Player"):
		var current_scene_file = get_tree().current_scene.filename
		var next_level_number = current_scene_file.to_int() + 1;
		
		var next_level_path = "res://Levels/Level_" + str(next_level_number) + ".tscn";
		get_tree().change_scene(next_level_path)
		pass
		
		


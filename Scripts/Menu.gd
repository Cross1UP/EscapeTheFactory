extends Control

func _ready():
	MusicController.stop_music()
	pass


func _on_Menu_pressed():
	get_tree().change_scene("res://Levels/Menu.tscn")

func _on_Play_pressed():
	get_tree().change_scene("res://Levels/Level_0.tscn")



func _on_Options_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()



